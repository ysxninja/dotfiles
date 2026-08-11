---@module 'hl'
-- Some default env vars.
hl.env("GDK_SCALE", "1.25") -- toolkit-specific scale
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_SCALE_FACTOR", "0.8")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")

-- java wayland support (still needed for AWT/Swing apps that aren't natively Wayland-aware yet)
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
-- hl.env("JDK_JAVA_OPTIONS", "--add-opens=java.desktop/sun.awt=ALL-UNNAMED")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
