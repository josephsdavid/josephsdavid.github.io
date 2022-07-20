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
