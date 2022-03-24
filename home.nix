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
    git-annex
    unzip
    p7zip
    brightnessctl
    signal-desktop

    # for pactl
    pulseaudio

    # programming
    fd
    ripgrep
    universal-ctags

    R

    # python
    python39
    black

    # viewers
    zathura
    imv

    # general
    file
    gnome.nautilus
    tree

    # transformers
    jq

    # linters
    python39Packages.flake8
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userEmail = "abhishek.dasgupta@cs.ox.ac.uk";
    userName = "Abhishek Dasgupta";
  };

  programs.rofi = {
    enable = true;
    font = "monospace 32";
    extraConfig = {
      modi = "window,run,ssh,drun";
    };
  };
  
  xresources.properties = import ./xresources.nix;

  programs.bash = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  xsession.enable = true;
  xsession.pointerCursor = {
    name = "Vanilla-DMZ-AA";
    package = pkgs.vanilla-dmz;
    size = 48;
  };
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
