# oop
function _hc(x)
    splitx = split(x, " ")
    # TODO: ThIS
    pushfirst!(splitx, "herbstclient")
    return reduce(((x,y) -> ` $(x) $y `), splitx)
end

function splitter(delim)
    _op(x,y) = string(x, " $(delim) ", y)
    return _op
end
ssplit = splitter("")

function kb(x, y...)
    return _hc("keybind $(reduce(ssplit, [x, y...]))")
end
function mod(x)
    return "Mod4-$(x)"
end

macro args(x...) end

function chain(x...)
    string("chain . ", reduce(_op, [x...]))
end

kws = ["chain", "kb"]

function parse_line(line)
    stack = []
    innards = []
    outer = []
    i=0
    for x in split(line, "")
        if x == "("
            push!(stack,x)
            push!(innards, x)
        elseif x == ")"
            pop!(stack)
            push!(innards, x)
        elseif x == " " 
            if length(innards) == 0 
                continue
            end
            if innards[end] == "," 
                continue
            end
            push!(innards, ",")
        else 
            push!(innards, x)
        end
    end
    string(innards...)
end

function runcmd(cmd)
    
end

map(readlines("config")) do line
    (eval(Meta.parse(parse_line(line))))
end
###
### macros and structs
###

struct Op{T}
    operation::T
end
Op(s::Union{Symbol, String, Number, Expr}) = Op(`$(s)`)

function _splitter(delim)
    return (x,y) -> `$(x) $(delim) $(y)` 
end
_chainer = _splitter(` . `)
_spacer = _splitter(` `)

(o::Op)() = `$(o.operation)` 
(o::Op)(x) =  _spacer(o.operation, x)
(o::Op)(x...)= reduce(_spacer, [x...]; init = o())
chain(x) = x
chain(x...)= reduce(_chainer, [x...]; init = `chain`)

macro op(x)
    return Op(x)
end
macro op(x::Symbol)
    return Op(x)
end
macro op(x::Expr)
    return Op(eval(x))
end
# TODO: Look up some the type system

_transform(x) = isa(x, Expr) ? eval(x) : x
macro op(x::Vararg{Union{Symbol, String, Number, Expr}})
    vars = map(_transform, [x...])
    Op(reduce( _spacer, vars))
end



###
### configuration
###
super(x) = `Mod4-$(x)`
super(x...) = reduce((x,y) -> `$(x)-$(y)`, [x...]; init=`Mod4`)

hc = @op herbstclient
k = @op hc(:keybind) super(:backspace) damn "hot" 4 (@op hc(:unlock))((chain(super(5), :ok, :wow)))
k2 = @op herbstclient keybind
rename = @op hc(:rename)

commands = [rename(:default, tags[1])]

function make_virtual_monitor(name, key)
    [hc(:add, name),
        k(super(key), :use_index, name-1)]
end


tags = collect(1:9)
vms = make_virtual_monitor.(tags, tags)
commands = vcat(commands, vcat(vms...))

# rotate frames in current monitor
rotate(n) = chain(:lock, repeat([:rotate], n)..., :unlock)

keybinds = [
(super(:slash), :spawn, "~/scripts/menus/system-menu.sh"),
(super(:Shift, :q), :spawn, "~/scripts/menus/locker.sh"),
(super(:Shift, :r), :reload),
(super(:y), rotate(3)),
(super(:Alt, :y), rotate(2)),
(super(:Shift, :y), rotate(1))
]
commands = vcat(commands, ( ((x) -> k(x...)).(keybinds) ))

commands

run(hc(rotate(3)))