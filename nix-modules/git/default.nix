{ config, pkgs, ... }: {

    home.packages = with pkgs; [
        git
        gh
    ];

    programs.git = {
        enable = true;
        userName = "anthonymolinari";
        userEmail = "amolinari017@gmail.com";
    };

    programs.gh = {
        enable = true;
        gitCredentialHelper = {
            enable = true;
        };
    };
}
