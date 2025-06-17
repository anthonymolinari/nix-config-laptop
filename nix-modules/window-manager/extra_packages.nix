{ config, pkgs, ... }: {
    # extra window manager packages w/ out config
    home.packages = with pkgs; [
        brightnessctl
        firefox
        kdePackages.dolphin
        overskride
        spotify
        wl-clipboard
    ];
}
