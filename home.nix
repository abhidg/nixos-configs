{ config, pkgs, ... }:

{
  imports = [
    ./vim.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "abhidg";
  home.homeDirectory = "/home/abhidg";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    brightnessctl
    signal-desktop

    # for pactl
    pulseaudio

    # programming
    fd
    ripgrep
    universal-ctags

    # languages
    python39
    R

    # viewers
    zathura
    imv

    # general
    file

    # linters
    python39Packages.flake8
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fzf.enable = true;

  programs.rofi = {
    enable = true;
    font = "monospace 18";
    extraConfig = {
      modi = "window,run,ssh,drun";
    };
  };
  
  xresources.properties = {
    "Xft.dpi" = 128;
    "URxvt.font" = "xft:monospace:size=12,xft:noto emoji:size=12";
    "URxvt.boldFont" = "xft:monospace:weight=bold:size=12,xft:noto emoji:weight=bold:size=12,xft:symbola";
  };

  programs.bash = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  xsession.enable = true;
  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config = {
    modifier = "Mod4";
    keybindings = import ./i3-keybindings.nix "Mod4";
  };

  services.network-manager-applet.enable = true;
  services.picom.enable = true;
  services.dunst.enable = true;
  services.gnome-keyring.enable = true;
  services.redshift = {
    enable = true;
    tray = true;
    latitude = 51.75;
    longitude = -1.25;
    temperature.night = 2800;
  };
}
