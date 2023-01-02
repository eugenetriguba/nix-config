{ config, lib, pkgs, ... }:

{
  # Some programs need dconf to save their settings.
  programs.dconf.enable = true;

  hardware.bluetooth = {
    enable = true;
    hsphfpd.enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services = {
    upower.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    xserver = {
      enable = true;
      autorun = true;
      layout = "us";
      xkbVariant = "";

      desktopManager.xterm.enable = true;
      displayManager = {
        defaultSession = "none+i3";
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3lock
          alacritty
          (python3Packages.py3status.overrideAttrs (oldAttrs: {
            propagatedBuildInputs = with python3Packages; [ pytz tzlocal ] ++ oldAttrs.propagatedBuildInputs;
          }))
        ];
      };

      libinput = {
        enable = true;
        mouse = {
          naturalScrolling = true;
        };
        touchpad = {
          tapping = true;
          naturalScrolling = true;
          disableWhileTyping = true;
        };
      };
    };
  };
}