{ config, pkgs, ... }: {

    home.packages = with pkgs; [
        nerd-fonts.fira-code
    ];

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
            name = "FiraCode Nerd Font";
            size = 9;
        };
    };
}
