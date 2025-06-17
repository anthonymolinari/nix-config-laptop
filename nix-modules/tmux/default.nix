{ config, pkgs, ...}: {

    home.packages = with pkgs; [
        tmux
        tmuxPlugins.sensible
        tmuxPlugins.prefix-highlight
        tmuxPlugins.mode-indicator
    ];

    programs.tmux = {
        enable = true;
        extraConfig = ''



        '';
    };
}
