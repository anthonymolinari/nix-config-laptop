{ config, pkgs,... }: 

{
    home.username = "anthony";
    home.homeDirectory = "/home/anthony";

    home.stateVersion = "25.05";

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    imports = [
        ./nix-modules
    ];

    nixpkgs.config.allowUnfree = true;

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
