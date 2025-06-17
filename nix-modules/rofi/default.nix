{ config, pkgs,... }: {
    home.packages = with pkgs; [
        rofi-power-menu
        rofi-wayland
    ];
}
