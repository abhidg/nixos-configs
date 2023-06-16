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
  home.stateVersion = "23.05";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    mr
    gh
    niv
    unzip
    p7zip

    # programming
    fd
    ripgrep
    universal-ctags

    python310
    python310Packages.pip
    black

    # general
    file
    tree

    # transformers
    jq

    # linters
    python310Packages.flake8
    black
  ];

  # Let Home Manager install and manage itself.
  programs.bash.enable = true;
  programs.home-manager.enable = true;

  programs.fzf.enable = true;
  programs.bat.enable = true;

  programs.git = {
    enable = true;
    userEmail = "abhishek.dasgupta@dtc.ox.ac.uk";
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
