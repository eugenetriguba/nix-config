{ config, lib, pkgs, stdenv, ... }:

let
  username = "eugene";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

  defaultPkgs = with pkgs; [
    _1password            # Password Manager: 1Password CLI
    _1password-gui        # Password Manager: 1Password GUI
    calibre               # e-book reader/library
    dig                   # DNS command-line tool
    docker-compose        # Docker manager
    dive                  # Explore docker layers
    duf                   # Disk usage/free utility
    exa                   # A better `ls`
    exercism              # Programming Practice: CLI for exercism.io
    firefox               # Browser
    git                   # Source Control
    go                    # Go Programming language
    glow                  # Terminal markdown viewer
    hack-font             # Monospace font
    htop                  # System resource usage TUI
    hyperfine             # Command-line benchmarking tool
    inter                 # Sans-Serif font
    jq                    # CLI tool for working with JSON
    jetbrains.clion       # Editor: JetBrains C IDE
    killall               # Kill processes by name
    libreoffice           # Office suite
    ncdu                  # Disk space info (a better du)
    neovim
    powertop
    ripgrep               # Fast grep
    rustup
    tldr                  # Simplified community-driven man pages
    tree                  # display files in a tree view    
    unzip
    vlc                   # media player
    vscode
    zip
  ];

  gnomePkgs = with pkgs.gnome; [
    eog       # Image viewer
    evince    # PDF reader
    nautilus  # File manager

    # file manager overlay
    # pkgs.nautilus-gtk3
    #pkgs.nautilus-bin
    #pkgs.nautilus-patched
  ];
in
{
  programs.home-manager.enable = true;

  imports = builtins.concatMap import [
    # ./modules
    # ./age
    # ./programs
    # ./scripts
    ./services
    # ./themes
  ];

  xdg = {
    inherit configHome;
    enable = true;
  };

  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";

    packages = defaultPkgs ++ gnomePkgs;

    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nvim";
    };
  };

  # restart services on change
  # systemd.user.startServices = "sd-switch";

  # Notifications about home-manager news
  news.display = "silent";
}