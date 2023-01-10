{ config, lib, pkgs, ... }:

{
  # Some programs need dconf to save their settings.
  programs.dconf.enable = true;

  hardware.bluetooth = {
    enable = true;
    # https://github.com/NixOS/nixpkgs/issues/114222
    # hsphfpd.enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services = {
    blueman.enable = true;

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
        gdm.enable = true;
      };

      windowManager.i3 = {
        enable = true;
        configFile = ./config;
        extraPackages = with pkgs; [
          rofi
          i3lock
          i3status
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
