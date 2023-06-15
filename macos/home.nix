{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.05";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.packages = with pkgs; [
    wget
    gh
    fd
    ripgrep
    python310
    black
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
