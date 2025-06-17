{ config, pkgs, ... }: {

    home.packages = with pkgs; [ waybar ];

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
                "hyprland/window"
            ];
            modules-center = [
                "clock"
            ];
            modules-right = [
                "tray"
                "backlight"
                "custom/divider"
                "pulseaudio"
                "custom/divider"
                "network"
                "custom/divider"
                "battery"
            ];
            "hyprland/window" = { format = "{}"; };
            "wlr/workspaces" = {
                on-scroll-up = "hyprctl dispatch workspace e+1";
                on-scroll-down = "hyprctl dispatch workspace e-1";
            };
            battery = { format = "󰁹 : {}%"; };
            backlight = {
                format = "󰃞  : {}";
                device = "acpi_video0";
            };
            pulseaudio = {
                format = "{icon} {volume}%";
                tooltip = false;
                format-muted = " ";
                on-click = "pamixer -t";
                on-scroll-up = "pamixer -i 5";
                on-scroll-down = "pamixer -d 5";
                scroll-step = 5;
                format-icons = {
                    headphone = " ";
                    hands-free = " ";
                    headset = " ";
                    default = [ "" " " "" ];
                };
            };
            "pulseaudio#microphone" = {
                format = "{format_source}";
                tooltip = false;
                format-source = "";
                format-source-muted ="";
                on-click = "pamixer --defualt-source -t";
                on-scroll-up = "pamixer --default-source -i 5";
                on-scroll-down = "pamixer --default-source -d 5";
                scroll-step = 5;
            };
            tray = {
                icon-size = 13;
                tooltip = false;
                spacing = 10;
            };
            network = {
                format = "  : {essid}";
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
