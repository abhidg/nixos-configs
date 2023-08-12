{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.05";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.packages = with pkgs; [
    wget
    gh
    fd
    bat
    jq
    ripgrep
    awscli2
    kubectl
    terraform
    black

    aspell
    aspellDicts.en
    gnupg
    ncspot
    pandoc
    shellcheck
    sqlite
    xsv
    yt-dlp
    visidata
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

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
