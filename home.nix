{ config, pkgs, ... }:

let
  inherit (pkgs) stdenv;
in
{
  imports = [
    ./vim.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "abhidg";
  home.homeDirectory = if stdenv.isDarwin then "/Users/abhidg" else "/home/abhidg";

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
    terraform
    awscli2
    xsv

    # programming
    fd
    ripgrep
    universal-ctags

    # general
    file
    tree

    # transformers
    jq
  ];

  # Let Home Manager install and manage itself.
  programs.zsh.enable = stdenv.isDarwin;
  programs.bash.enable = !stdenv.isDarwin;
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
