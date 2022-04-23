{ config, pkgs, ... }:

{
  services.grobi.enable = true;
  services.grobi.rules = [
    {
      name = "Home";
      outputs_connected = [ "DP1" ];
      configure_single = "DP1";
      primary = true;
      atomic = true;
      execute_after = [
        "${pkgs.xorg.xrandr}/bin/xrandr --dpi 144"
        "${pkgs.i3}/bin/i3-msg restart"
      ];
    }
    {
      name = "Mobile";
      outputs_disconnected = [ "DP1" ];
      configure_single = "eDP1";
      primary = true;
      atomic = true;
      execute_after = [
        "${pkgs.xorg.xrandr}/bin/xrandr --dpi 96"
        "${pkgs.i3}/bin/i3-msg restart"
      ];
    }
  ];
}
