{ config, pkgs, lib, ... }: 

{
    home.username = "anthony";
    home.homeDirectory = "/home/anthony";

    home.stateVersion = "25.05";

    home.packages = with pkgs; [
        tmux
        ranger
        neovim
        git
        kdePackages.dolphin 
        hyprpaper
        waybar
        zsh
        nerd-fonts.fira-code 
        rofi-wayland
        rofi-power-menu
        wl-clipboard
        firefox
        lazygit
    ];

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    imports = [
        ./nix_modules/hyprland.nix
        ./nix_modules/kitty.nix
        ./nix_modules/theme.nix
        ./nix_modules/waybar.nix
        ./nix_modules/git.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
