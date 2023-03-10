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
    dropbox
    duf                   # Disk usage/free utility
    exa                   # A better `ls`
    exercism              # CLI for exercism.io
    firefox               # Browser
    git                   # Source Control
    go                    # Go Programming language
    hack-font             # Monospace font
    htop                  # System resource usage TUI
    hyperfine             # Command-line benchmarking tool
    inter                 # Sans-Serif font
    jq                    # CLI tool for working with JSON
    jetbrains.clion       # Editor: JetBrains C IDE
    jetbrains.pycharm-professional
    killall               # Kill processes by name
    libreoffice           # Office suite
    mullvad-vpn           # Mullvad VPN Client CLI + GUI
    ncdu                  # Disk space info (a better du)
    neovim
    obsidian
    powertop
    python3
    qbittorrent           # Torrent Client
    ripgrep               # Fast grep
    rustup
    speedtest-cli
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
  ];
in
{
  programs.home-manager.enable = true;

  imports = builtins.concatMap import [
    ./programs
    ./services
    ./dconf
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

  # Notifications about home-manager news
  news.display = "silent";
}
