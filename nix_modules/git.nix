{ config, pkgs, ... }: {

    programs.git = {
        enable = true;
        userName = "anthonymolinari";
        userEmail = "amolinari017@gmail.com";
    };
}
