{ config, pkgs, ... }:

{

    # waybar 
    programs.waybar = {
        enable = true;
        settings = [{
            layer = "top";
            positiion = "top";
            mod = "dock";
            exclusive = true;
            passthrough = false;
            gtk-layer-shell = true;
            height = 0;
            modules-left = [
                "hyprland/workspaces"
            ];
            modules-center = ["hyprland/window"];
            modules-right = [
                "tray"
                "network"
                "custom/divider"
                "backlight"
                "custom/divider"
                "battery"
                "custom/divider"
                "clock"
            ];
            "hyprland/window" = { format = "{}"; };
            "wlr/workspaces" = {
                on-scroll-up = "hyprctl dispatch workspace e+1";
                on-scroll-down = "hyprctl dispatch workspace e-1";
            };
            battery = { format = "B: {}%"; };
            backlight = {
                format = "BL: {}";
                device = "acpi_video0";
            };
            tray = {
                icon-size = 13;
                tooltip = false;
                spacing = 10;
            };
            network = {
                format = " {essid}";
                fomat-disconnected = " no wifi";
            };
            clock = {
                format = "{:%I:%M %p %m/%d}";
                tooltip-format = ''
                    <big>{:%Y %B}</big>
                    <tt><small>{calendar}</small></tt>'';
            };
            "custom/divider" = {
                format = " | ";
                interval = "once";
                tooltip = false;
            };
            "custom/endright" = {
                format = "_";
                interval = "once";
                tooltip = false;
            };
        }];        
    };


    
}
