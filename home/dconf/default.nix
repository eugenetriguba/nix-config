let
  config = {
    dconf.settings = {
      "org/gnome/desktop/peripherals/mouse" = {
        natural-scroll = true;
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
	two-finger-scrolling-enabled = true;
      };
    };
  };
in
[
  config
]

