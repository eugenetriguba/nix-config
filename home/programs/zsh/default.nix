{ pkgs, lib, ... }:

let
    pyenv = pkgs.callPackage ./pyenv.nix { };
in
{
    programs = {
        direnv = {
            enable = true;
            enableZshIntegration = true;
        };
        zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
            plugins = [
                {
                    name = "powerlevel10k";
                    src = pkgs.zsh-powerlevel10k;
                    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
                }
                {
                    name = "powerlevel10k-config";
                    src = lib.cleanSource ./p10k-config;
                    file = "p10k.zsh";
                }
            ];
            oh-my-zsh = {
                enable = true;
                plugins = ["git"];
            };
            shellAliases = {
                gs = "git status";
                gc = "git commit";
                ga = "git add";
                gd = "git diff";
                gds = "git diff --staged";
                gp = "git push";
                gpo = "git push origin";
                gpl = "git pull";
                gl = "git log";
                gch = "git checkout";
                gv = "git log --graph --decorate --oneline";

                h = "history 25";
                j = "jobs -l";
                l = "ls -al";
                o = "xdg-open .";
                open = "xdg-open";

                vi = "nvim";
                vim = "nvim";
            };
            initExtra = ''
                export PATH="$HOME/.local/bin:$PATH"
            '';
        };
    };
}
