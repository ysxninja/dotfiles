-- Pyprland scratchpad window rules
--
-- NOTE on animations: since Hyprland 0.55, hl.window_rule() only exposes
-- `no_anim` (fully disable animations for the window) and `animation`
-- (force a single named/style animation for the window). There is no
-- per-rule control over individual animation categories (windows/fade/
-- windowsIn/windowsOut) like the old inline "animation = windows, 0"
-- style lines implied. Below, rules that disabled both windows+fade
-- animations are translated to `no_anim = true`. The music scratchpad
-- rule, which wanted windowsIn enabled but windowsOut/fade disabled,
-- can't be reproduced exactly at the window-rule level -- that kind of
-- asymmetric in/out behavior belongs in the global `animations` config
-- (a custom named animation), which is then referenced here via
-- `animation = "<name>"`. A reasonable approximation is used below.

-- Default Scratchpad
hl.window_rule({
	name = "windowrule-1",
	match = { class = "^(scratchpad)$" },
	float = true,
	-- no_anim = true, -- was: animation = windows,0 / animation = fade,0
})

-- Terminal scratchpad
hl.window_rule({
	name = "windowrule-3",
	match = { class = "^(scratchpadttrm)$" },
	float = true,
	-- animation = "popin",
	-- no_anim = true, -- was: animation = windows,0 / animation = fade,0
})

-- Music scratchpad
hl.window_rule({
	name = "windowrule-4",
	match = { class = "^(scratchpadmusic)$" },
	float = true,
	-- was: animation = windowsIn,1,7,default / windowsOut,0 / fade,0
	-- Approximated as a forced "slide" style; define a custom animation
	-- named e.g. "musicscratchpad" in your global animations config if
	-- you need the exact asymmetric in/out timing/curve.
	-- animation = "slide",
})

-- -- bordercolor rgba(d9e0eeee) rgba(f9e2afee) 45deg,$musicscratchpad
-- hl.window_rule({
-- 	match = { class = "^(scratchpadmusic)$" },
-- 	border_color = { colors = { "rgba(d9e0eeee)", "rgba(f9e2afee)" }, angle = 45 },
-- })
-- -- opacity 0.85,$termscratchpad
-- hl.window_rule({
-- 	match = { class = "^(scratchpadttrm)$" },
-- 	opacity = "0.85",
-- })

hl.window_rule({
	name = "windowrule-5",
	match = { title = "^(New Tab - Brave)$" },
	opacity = "0.90",
})

hl.window_rule({
	name = "windowrule-6",
	match = { title = "^(Mozilla Firefox)$" },
	opacity = "0.90",
})

hl.window_rule({
	name = "windowrule-7",
	match = { class = "^(org.keepassxc.KeePassXC)$" },
	opacity = "0.9",
})

hl.window_rule({
	name = "windowrule-8",
	match = { class = "^(thunar)$" },
	opacity = "0.85",
})

hl.window_rule({
	name = "windowrule-9",
	match = { class = "^(Alacritty)$" },
	fullscreen = true,
})

-- local dunst = "^(Dunst)$"
-- hl.window_rule({ match = { class = dunst }, animation = "fade" })
-- hl.window_rule({
-- 	match = { class = ".*" },
-- 	-- nomaximizerequest has no direct hl.window_rule equivalent in the
-- 	-- current schema -- you'll probably like this.
-- })

---------------------------------------------------------------------
-- Open applications on specific workspaces
---------------------------------------------------------------------

hl.window_rule({
	name = "windowrule-10",
	match = { class = "(mpv)" },
	workspace = "2",
	fullscreen = true,
})

hl.window_rule({
	name = "windowrule-11",
	match = { class = "(io.github.celluloid_player.Celluloid)" },
	workspace = "2",
	fullscreen = true,
})

hl.window_rule({
	name = "windowrule-12",
	match = { class = "(google-chrome)" },
	workspace = "3",
})

hl.window_rule({
	name = "windowrule-13",
	match = { class = "(burp-StartBurp)" },
	workspace = "2",
})

---------------------------------------------------------------------
-- Fullscreen for assigned workspace apps
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Open specific apps in specific modes
---------------------------------------------------------------------

hl.window_rule({
	name = "windowrule-14",
	match = { class = "(burp-StartBurp)", title = "(Settings)" },
	float = true,
	center = true,
	size = "(monitor_w*0.8) (monitor_h*0.8)",
})

hl.window_rule({
	name = "windowrule-15",
	match = { title = "^(File Transfer)(.*)$" },
	float = true,
})

hl.window_rule({
	name = "windowrule-16",
	match = { class = "(iwgtk)" },
	float = true,
})

hl.window_rule({
	name = "windowrule-17",
	match = { class = "(xdm-app)" },
	float = true,
})

hl.window_rule({
	name = "windowrule-18",
	match = { class = "(org.twosheds.iwgtk)" },
	float = true,
})

hl.window_rule({
	name = "windowrule-19",
	match = { class = "(org.kde.kdeconnect.handler)" },
	float = true,
})

hl.window_rule({
	name = "windowrule-20",
	match = { class = "(org.kde.kdeconnect.daemon)" },
	float = true,
})

-- Thunderbird
hl.window_rule({
	name = "windowrule-21",
	match = { class = "^(thunderbird)$", initial_title = "^(\\s*)$" },
	float = true,
})

hl.window_rule({
	name = "windowrule-22",
	match = { class = "^(thunderbird)$", initial_title = "^(Calendar Reminders)$" },
	opacity = "0.80 0.70",
	float = true,
	size = "700 400",
})

-- Browser File Picker
hl.window_rule({
	name = "windowrule-23",
	match = { class = "(google-chrome)", title = "(Open Files)" },
	float = true,
	size = "700 400",
})

-- Generic
hl.window_rule({
	name = "windowrule-24",
	match = { title = "^(File Operation Progress)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "windowrule-25",
	match = { title = "^(Properties)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "windowrule-26",
	match = { title = "^(Confirm Replace)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "windowrule-27",
	match = { title = "^(Rename)$" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "windowrule-28",
	match = { initial_class = "thunar", title = "Rename: .*" },
	float = true,
})

-- Blueman
-- Float the window
-- Resize it (in layout px)
-- Move it to top-right
hl.window_rule({
	name = "windowrule-29",
	match = { class = "^(blueman-manager)$" },
	float = true,
	size = "333 604",
	move = "1165 28",
})

-- Intellij - for when buttons unclickable
-- find in files
-- hl.window_rule({ match = { class = "jetbrains-toolbox", float = true }, no_initial_focus = true })
-- -- other dialogs
-- hl.window_rule({ match = { class = "(jetbrains-)(.*)", title = "^$", initial_title = "^$", float = true }, center = true })
-- hl.window_rule({ match = { class = "(jetbrains-)(.*)", initial_title = "(.+)", float = true }, center = true })
-- hl.window_rule({ match = { class = "(jetbrains-)(.*)", float = true }, no_initial_focus = true })

---------------------------------------------------------------------
-- Layer rules
---------------------------------------------------------------------

hl.layer_rule({
	name = "layerrule-1",
	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	name = "layerrule-2",
	match = { namespace = "swaync" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	name = "layerrule-3",
	match = { namespace = "notifications" },
	-- no_anim = true,
})

hl.layer_rule({
	name = "layerrule-4",
	match = { namespace = "rofi" },
	blur = true,
})
