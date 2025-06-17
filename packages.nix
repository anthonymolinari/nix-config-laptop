{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        btop
        brightnessctl
        firefox
        gh
        git
        hyprpaper
        hyprlock
        kdePackages.dolphin 
        lazygit
        neovim
        nerd-fonts.fira-code 
        overskride
        ranger
        spotify
        tmux
        rofi-power-menu
        rofi-wayland
        waybar
        wl-clipboard
        zsh
    ];
}
