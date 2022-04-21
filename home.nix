{ config, pkgs, ... }:

{
  imports = [
    ./vim.nix
    ./xresources.nix
    ./alacritty.nix
    ./grobi
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
    niv
    act
    git-annex
    unzip
    p7zip
    brightnessctl
    playerctl
    signal-desktop

    # for pactl
    pulseaudio

    # programming
    fd
    ripgrep
    nerdfonts
    liberation_ttf
    universal-ctags

    R

    # python
    python39
    black

    # viewers
    zathura
    imv
    mpv

    # general
    file
    libsForQt5.dolphin
    libsForQt5.breeze-gtk
    libsForQt5.breeze-icons
    libsForQt5.breeze-qt5
    tree
    flameshot

    # transformers
    jq

    # linters
    python39Packages.flake8

    # research
    zotero
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fzf.enable = true;
  programs.bat = {
    enable = true;
    config.theme = "gruvbox-dark";
  };

  programs.git = {
    enable = true;
    userEmail = "abhishek.dasgupta@cs.ox.ac.uk";
    userName = "Abhishek Dasgupta";
  };

  programs.rofi = {
    enable = true;
    theme = "Monokai";
    extraConfig = {
      modi = "window,run,ssh,drun";
    };
  };
  
  home.file.".config/fontconfig/fonts.conf".text = ''
<match target="pattern">
  <test name="family" qual="any">
    <string>monospace</string>
  </test>
  <edit binding="strong" mode="prepend" name="family">
    <string>FiraMono Nerd Font Mono</string>
  </edit>
</match>
  '';

  programs.bash = {
    enable = true;
  };
  programs.starship.enable = true;
  programs.starship.settings = {
    package.disabled = true;
    aws.disabled = true;
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
    terminal = "alacritty";
    keybindings = import ./i3-keybindings.nix "Mod4";
  };

  services.network-manager-applet.enable = true;
  services.picom.enable = true;
  services.dunst.enable = true;
  services.dunst.settings = {
    global = {
      width = 500;
      font = "BitstreamVeraSansMono Nerd Font Mono 11";
      frame_color = "#111111";
    };
    urgency_normal = {
      background = "#111111";
    };
  };

  services.gnome-keyring.enable = true;
  services.redshift = {
    enable = true;
    tray = true;
    latitude = 51.75;
    longitude = -1.25;
    temperature.night = 2800;
  };
}
