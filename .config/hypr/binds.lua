---@module 'hl'
local mainMod = "ALT"

-- Variables/Programs
local terminal = "alacritty"
local fileManager = "thunar"
-- $menu = wofi
--
local menu = "rofi -show drun -show-icons -font 'JetBrainsMono Nerd Font 13'"
-- $powermenu = $HOME/.config/wofi/powermenu.sh
local powermenu = "rofi -show power-menu -modi power-menu:" .. os.getenv("HOME") .. "/.local/bin/rofi-power-menu"
local passmenu = os.getenv("HOME") .. "/.local/bin/passmenu -t"
local passmenuedit = os.getenv("HOME") .. "/.local/bin/passmenu -e"
local clipmenu = os.getenv("HOME") .. "/.local/bin/rofi-copyq.py"

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. " + " .. "Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + " .. "Q", hl.dsp.window.close())
hl.bind(mainMod .. " + " .. "CONTROL" .. " + " .. "Q", hl.dsp.exit())
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd(powermenu))
hl.bind(mainMod .. " + " .. "W", hl.dsp.exec_cmd(passmenu))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "W", hl.dsp.exec_cmd(passmenuedit))
hl.bind("SUPER" .. " + " .. "L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))

-- Lock the screen
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "space", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "E", hl.dsp.exec_cmd(fileManager))
hl.bind(
	mainMod .. " + " .. "SHIFT" .. " + " .. "R",
	hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/reload.sh")
)

-- reload hyprland
hl.bind(
	mainMod .. " + " .. "SHIFT" .. " + " .. "D",
	hl.dsp.exec_cmd("killall swaync && swaync; exec notify-send 'restart swaync'")
)

-- bind = $mainMod SHIFT, M, exec, udiskie-umount -a -d

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.exec_cmd("udiskie-mount -a"))
hl.bind(mainMod .. " + " .. "P", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "P", hl.dsp.layout("swapnext"))

-- Switch focus between windows in a floating workspace
hl.bind(mainMod .. " + " .. "space", hl.dsp.window.cycle_next())

-- change focus to another window

-- TODO: manual review (unknown dispatcher: bringactivetotop)
-- hl.bind("$mainMod + space", hl.dsp.bringactivetotop())

-- bring it to the top

-- Move focus with mainMod + arrow keys

hl.bind(mainMod .. " + " .. "h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))

-- Clipboard history
hl.bind(mainMod .. " + " .. "V", hl.dsp.exec_cmd(clipmenu))

-- Lid close/open event

-- trigger when the switch is toggled, check switch with `hyprctl devices`
-- bindl=,switch:Lid Switch,exec,hyprlock
-- bindl=,switch:sleep-button,exec,hyprlock
-- trigger when the switch is turning on
-- bindl=,switch:on:[switch name],exec,hyprctl keyword monitor "eDP-1, 2560x1600, 0x0, 1"
-- trigger when the switch is turning off
-- bindl=,switch:off:[switch name],exec,hyprctl keyword monitor "eDP-1, disable"

-- Waybar toggle
hl.bind(mainMod .. " + " .. "M", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Screenshot
hl.bind(mainMod .. " + " .. "S", hl.dsp.exec_cmd('grim -g "$(slurp)"-| swappy -f-'))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)"-| swappy -f-'))

-- Screen record
-- TODO: Write script to handle this recording, naming and timer
-- bind = $mainMod SHIFT, S, exec, wf-recorder --codec=libvpx-vp9 --file=recording.webm -g "$(slurp)"
hl.bind(mainMod .. " + " .. 7, hl.dsp.exec_cmd("pypr toggle term"))
hl.bind(mainMod .. " + " .. 8, hl.dsp.exec_cmd("pypr toggle lfub"))
hl.bind(mainMod .. " + " .. 9, hl.dsp.exec_cmd("pypr toggle music"))
hl.bind(mainMod .. " + " .. 0, hl.dsp.exec_cmd("pypr toggle btm"))

-- bind=$mainMod,minus,exec,pypr toggle pavucontrol
-- Blue light filter using wl-gammarelay with mainMod + Up/Down
-- bind= $mainMod ,Up,exec,busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -500
-- bind= $mainMod ,Down,exec,busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +500
-- Move/resize windows with mainMod + LMB/RMB and dragging

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
