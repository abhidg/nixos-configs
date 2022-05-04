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
    gh
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
    python310
    black
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

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.starship.enable = true;
  programs.starship.settings = {
    package.disabled = true;
    aws.disabled = true;
  };
}
