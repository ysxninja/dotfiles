---@module 'hl'
---
require("autostart")
require("env")
require("binds")
require("media-binds")
require("windowrules")
---
-- $laptop = LVDS-1
-- $external = VGA-1
-- monitor=$laptop,1366x768,auto,1
-- monitor=$external,1024x768,0x0,1
-- # monitor=,preferred,0x0,1
--
-- # Bind Workspaces to each display
-- workspace = 1, monitor:$external
-- workspace = 2, monitor:$external
-- workspace = 3, monitor:$laptop
-- workspace = 4, monitor:$laptop
-- change monitor to high resolution, the last argument is the scale factor
-- hyprland with bitdepth breaks screensharing
-- monitor=,highres,auto,1.20,bitdepth,10
hl.monitor({
	output = "",
	mode = "highres",
	position = "auto",
	scale = 1.20,
})
-- monitor = HDMI-A-1,highres,auto,1,mirror,eDP-1
hl.monitor({
	output = "HDMI-A-1",
	mode = "highres",
	position = "auto-left",
	scale = 1.25,
})

-- unscale XWayland
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/
hl.config({
	input = {
		kb_layout = "us",
		-- kb_options = ctrl:nocaps # use /etc/keyd/default.conf
		repeat_rate = 62,
		repeat_delay = 190,
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true,
			-- clickfinger_behavior = true # on click lb, two for mb, 3 for rb
		},
		sensitivity = 0,
		-- -1.0 - 1.0, 0 means no modification.
	},
})

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 2,
		border_size = 2,
		-- col.active_border = rgba(ff000000) rgba(ffffffff) rgba(ff000000) rgba(ffffffff) 45deg
		-- col.inactive_border = rgba(11707b7c)
		-- col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
		-- col.inactive_border = rgba(595959aa)
		layout = "master",
		allow_tearing = false,
		resize_on_border = true,
		hover_icon_on_border = true,
		col = {
			active_border = { colors = { "rgb(000000)", "rgb(4A7599)" }, angle = 45 },
			inactive_border = "rgb(000000)",
		},
	},
})

hl.config({
	cursor = {
		inactive_timeout = 3,
	},
})

hl.config({
	decoration = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		rounding = 8,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
		-- drop_shadow = false
		-- shadow_range = 4
		-- shadow_render_power = 3
		-- col.shadow = rgba(1a1a1aee)
		dim_inactive = false,
		dim_strength = 0.1,
		dim_around = 0.4,
		-- for Floating windows
	},
})

-- Some default animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/ for more

hl.config({ animations = { enabled = true } })

-- hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
-- hl.animation({ leaf = NAME, enabled = ONOFF, speed = SPEED, bezier = CURVE, style = STYLE })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = false, speed = 3, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = false, speed = 3, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = false, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default" })

hl.config({
	dwindle = {
		-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
		preserve_split = true,
		-- you probably want this
	},
})

hl.config({
	master = {
		-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
		-- new_status = master # set new window as master
		new_on_top = false,
		allow_small_split = false,
		-- Split factor
		mfact = 0.55,
	},
})

-- Gestures configured differently, refer to wiki

hl.config({
	misc = {
		-- See https://wiki.hyprland.org/Configuring/Variables/ for more
		force_default_wallpaper = 0,
		-- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true,
		-- If true disables the random hyprland logo / anime girl background. :(
		disable_splash_rendering = true,
		-- Disable splash text
		-- enable_swallow = true
		-- swallow_regex = (scratchpadttrm)|(Alacritty)|(kitty)
	},
})

hl.config({
	experimental = {
		-- xx_color_management_v4 = true
	},
})
