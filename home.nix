{ config, pkgs, lib, ... }: 

{
    home.username = "anthony";
    home.homeDirectory = "/home/anthony";

    home.stateVersion = "25.05";

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    imports = [
        ./packages.nix
        ./nix_modules/hyprland.nix
        ./nix_modules/kitty.nix
        ./nix_modules/theme.nix
        ./nix_modules/waybar.nix
        ./nix_modules/hyprlock.nix
        ./nix_modules/git.nix
        ./nix_modules/zsh.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
