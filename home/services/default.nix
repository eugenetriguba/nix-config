{
  services = {
    # Screenshots
    flameshot.enable = true;

    # Optimize battery life (https://linrunner.de/tlp/index.html)
    tlp.enable = true;

    # For using PGP keys
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };
}