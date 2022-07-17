###
### configuration
###
super(x) = `Mod4-$(x)`
super(x...) = reduce((x,y) -> `$(x)-$(y)`, [x...]; init=`Mod4`)

hc = @op herbstclient
k = @op hc(:keybind) super(:backspace) super "hot" 4 (@op hc(:unlock))((chain(super(5), :ok, :wow)))
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