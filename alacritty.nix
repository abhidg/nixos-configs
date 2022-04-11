{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    font.size = 12;
    draw_bold_text_with_bright_colors = true;
  };
  programs.alacritty.settings.colors = {
    primary.background = "0x000000";
    primary.foreground = "0xffffff";

    normal = {
      black   = "0x1a1a1a";
      red     = "0xff929f";
      green   = "0x5fc940";
      yellow  = "0xc5b300";
      blue    = "0x5fb8ff";
      magenta = "0xef91df";
      cyan    = "0x1dc5c3";
      white   = "0xc4bdaf";
    };

    bright = {
      black   = "0x242536";
      red     = "0xf69d6a";
      green   = "0x88c400";
      yellow  = "0xd7ae00";
      blue    = "0x8cb4f0";
      magenta = "0xde99f0";
      cyan    = "0x00ca9a";
      white   = "0xe0e0e0";
    };
  };
}
