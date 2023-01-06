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
	    shellAliases = {
	        # Git
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

		# General
		h = "history 25";
		j = "jobs -l";
		l = "ls -al";
		o = "xdg-open .";
		open = "xdg-open";

		vi = "nvim";
		vim = "nvim";
	    };
	};
    };
}
