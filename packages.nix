{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        brightnessctl
        firefox
        gh
        git
        htop
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
