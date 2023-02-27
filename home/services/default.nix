let
  config =  {
    services = {
      # Screenshots
      flameshot.enable = true;

      # For using PGP keys
      gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
      };
    };
  };
in
[
  config
]
