{ config, pkgs, lib, ... }: 

{
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
            font_family = "FiraCode Nerd Font";
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
            font_size = "12";
        };
    };
    # end kitty terminal config
}
