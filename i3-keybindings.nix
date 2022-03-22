mod:
{
  "${mod}+w" = "exec firefox";
  "${mod}+Return" = "exec urxvt";
  "Mod1+space" = "exec rofi -show window";
  "Mod1+Shift+space" = "exec rofi -show drun";
  "Mod1+Shift+Return" = "exec urxvt";
  "${mod}+h" = "kill";
  "${mod}+Shift+m" = "exec amixer -q sset Master toggle";
  "${mod}+Alt+s" = "exec kill $(pgrep -f shutter); shutter -s";
  "${mod}+Shift+grave" = "move scratchpad";
  "${mod}+grave" = "scratchpad show";
  "${mod}+j" = "focus left";
  "${mod}+k" = "focus down";
  "${mod}+l" = "focus up";
  "${mod}+semicolon" = "focus right";
  "${mod}+Left" = "focus left";
  "${mod}+Down" = "focus down";
  "${mod}+Up" = "focus up";
  "${mod}+Right" = "focus right";
  "${mod}+Shift+j" = "move left";
  "${mod}+Shift+k" = "move down";
  "${mod}+Shift+l" = "move up";
  "${mod}+Shift+semicolon" = "move right";
  "${mod}+Shift+Left" = "move left";
  "${mod}+Shift+Down" = "move down";
  "${mod}+Shift+Up" = "move up";
  "${mod}+Shift+Right" = "move right";
  "${mod}+hyphen" = "split h";
  "${mod}+v" = "split v";
  "${mod}+f" = "fullscreen";
  "${mod}+Shift+b" = "layout splith";
  "${mod}+Shift+v" = "layout splitv";
  "${mod}+Shift+s" = "layout stacking";
  "${mod}+Shift+t" = "layout tabbed";
  "${mod}+Shift+f" = "floating toggle";
  "${mod}+1" = "workspace 1";
  "${mod}+2" = "workspace \"2: web\"";
  "${mod}+3" = "workspace 3";
  "${mod}+4" = "workspace 4";
  "${mod}+5" = "workspace 5";
  "${mod}+6" = "workspace 6";
  "${mod}+7" = "workspace 7";
  "${mod}+8" = "workspace 8";
  "${mod}+9" = "workspace 9";
  "${mod}+Shift+1" = "move container to workspace 1";
  "${mod}+Shift+2" = "move container to workspace \"2: web\"";
  "${mod}+Shift+3" = "move container to workspace 3";
  "${mod}+Shift+4" = "move container to workspace 4";
  "${mod}+Shift+5" = "move container to workspace 5";
  "${mod}+Shift+6" = "move container to workspace 6";
  "${mod}+Shift+7" = "move container to workspace 7";
  "${mod}+Shift+8" = "move container to workspace 8";
  "${mod}+Shift+9" = "move container to workspace 9";
  "${mod}+Shift+r" = "restart";
  "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";

  # volume
  "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
  "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
  "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
  "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";

  # brightness
  "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set +5%";
  "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 5%-";
}

