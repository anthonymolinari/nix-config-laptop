{ config, pkgs, ... }: {

    home.packages = with pkgs; [
        zsh
    ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
            theme = "";
        };

        plugins = [
            {
                name = "zsh-nix-shell";
                file = "nix-shell.plugin.zsh";
                src = pkgs.fetchFromGitHub {
                    owner = "chisui";
                    repo = "zsh-nix-shell";
                    rev = "v0.8.0";
                    sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
                };
            }
        ];

        shellAliases = {
            update = "home-manager switch";
            edit = "nvim ~/.config/home-manager";
            ssh = "kitty +kitten ssh";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };
}
