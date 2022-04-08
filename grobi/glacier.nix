{ config, pkgs, ... }:

{
  services.grobi.enable = true;
  services.grobi.rules = [
    {
      name = "Home";
      outputs_connected = [ "DP-1" ];
      configure_single = "DP-1";
      primary = true;
      atomic = true;
      execute_after = [
        "${pkgs.xorg.xrandr}/bin/xrandr --dpi 144"
        "${pkgs.i3}/bin/i3-msg reload"
      ];
    }
    {
      name = "Mobile";
      outputs_disconnected = [ "DP-2" ];
      configure_single = "eDP-1";
      primary = true;
      atomic = true;
      execute_after = [
        "${pkgs.xorg.xrandr}/bin/xrandr --dpi 224"
        "${pkgs.i3}/bin/i3-msg reload"
      ];
    }
  ];
}
