{ config, pkgs, lib, ... }: 

{
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "anthony";
    home.homeDirectory = "/home/anthony";

    home.stateVersion = "25.05";

    # kitty terminal config
    programs.kitty = lib.mkForce {
        enable = true;
        settings = {
            config_os_window_close = 0;
            dynamic_background_opacity = true;
            enable_audio_bell = false;
            mouse_hide_wait = "-1.0";
            window_padding_width = 4;
            background_opacity = "0.5";
            background_blur = 5;
            font_size = "12";
            symbol_map = let
                mappings = [
                "U+23FB-U+23FE"
                    "U+2B58"
                    "U+E200-U+E2A9"
                    "U+E0A0-U+E0A3"
                    "U+E0B0-U+E0BF"
                    "U+E0C0-U+E0C8"
                    "U+E0CC-U+E0CF"
                    "U+E0D0-U+E0D2"
                    "U+E0D4"
                    "U+E700-U+E7C5"
                    "U+F000-U+F2E0"
                    "U+2665"
                    "U+26A1"
                    "U+F400-U+F4A8"
                    "U+F67C"
                    "U+E000-U+E00A"
                    "U+F300-U+F313"
                    "U+E5FA-U+E62B"
                ];
            in
                (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
        };
    };
    # end kitty terminal config


    wayland.windowManager.hyprland.enable = true;

    home.packages = with pkgs; [
        tmux
        ranger
        neovim
        git
        nautilus
        hyprpaper
        waybar
    ];

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    # hyprland config
    wayland.windowManager.hyprland.settings = {
        monitor = "eDP-1, 1920x1080@60, 0x0, 1.0";
        "$mod" = "SUPER";
        bind = [
            "$mod, F, exec, firefox"
            "$mod, RETURN, exec, kitty"
            "$mod, H, exec, nautilus"
            "SUPER SHIFT, H, movewindow, l"
            "SUPER SHIFT, L, movewindow, r"
            "SUPER SHIFT, K, movewindow, u"
            "SUPER SHIFT, J, movewindow, d"
            "SUPER SHIFY, E, exit"
        ] 
        ++ (
            # workspaces
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
	            in [
	                "$mod, code:1${toString i}, workspace, ${toString ws}"
	            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	            ]
            )
            9)
        );
    };


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

    # theme
    home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 9;
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.flat-remix-gtk;
            name = "Flat-Remix-GTK-Grey-Darkest";
        };

        iconTheme = {
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
        };

        font = {
            name = "Sans";
            size = 9;
        };
    };

    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [
                "~/Pictures/wallpapers/wallpaper_1.jpg"
            ];  
            wallpaper = [
                "eDP-1, ~/Pictures/wallpapers/wallpaper_1.jpg"
            ];
        };
    };


    # end hyprland config

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
