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
  home.stateVersion = "22.05";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    niv
    unzip
    p7zip

    # programming
    fd
    ripgrep
    universal-ctags

    python310
    black

    # general
    file
    tree

    # transformers
    jq

    # linters
    python310Packages.flake8
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

  programs.bash = {
    enable = true;
  };
  programs.starship.enable = true;
  programs.starship.settings = {
    package.disabled = true;
    aws.disabled = true;
  };
}
