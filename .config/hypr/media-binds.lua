---@module 'hl'

-- $SCRIPT = ~/.config/waybar/scripts/
--
-- bind = , xf86audioraisevolume, exec, $SCRIPT/volume --inc
-- bind = , xf86audiolowervolume, exec, $SCRIPT/volume --dec
-- bind = , xf86AudioMicMute, exec, $SCRIPT/volume --toggle-mic
-- bind = , xf86audioMute, exec, $SCRIPT/volume --toggle
--
-- bind = , xf86KbdBrightnessDown, exec, $SCRIPT/kb-brightness --dec
-- bind = , xf86KbdBrightnessUp, exec, $SCRIPT/kb-brightness --inc
--
-- bind = , xf86MonBrightnessDown, exec, $SCRIPT/brightness --dec
-- bind = , xf86MonBrightnessUp, exec, $SCRIPT/brightness --inc
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volumectl -u up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volumectl -u down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volumectl toggle-mute"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("volumectl -m toggle-mute"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("lightctl down"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("lightctl up"))

-- bind = ,XF86AudioLowerVolume, exec, pactl -- set-sink-volume 0 -10%
-- bind = ,XF86AudioRaiseVolume, exec, pactl -- set-sink-volume 0 +10%
-- bind = ,XF86AudioMute, exec, pactl -- set-sink-mute 0 toggle
-- bind = ,XF86AudioMicMute, exec, pactl -- set-source-mute 0 toggle
-- bind = ,XF86MonBrightnessDown, exec, brightnessctl s 5%-
-- bind = ,XF86MonBrightnessUp, exec, brightnessctl s +10%
