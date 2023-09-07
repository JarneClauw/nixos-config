###
### Gnome settings configuration
###

inputs:
  let
    wallpaper = "file:///home/${inputs.user}/${inputs.repo}/wallpapers/${inputs.wallpaper}";
  in
    {
      dconf.settings = {
        "org/gnome/interface" = {
          color-scheme = "prefer-dark";
	  enable-hot-corners = false;
	  show-battery-percentage = true;
        };

        "org/gnome/desktop/background" = {
          picture-uri = "${wallpaper}";
          picture-uri-dark = "${wallpaper}";
          primary-color = "#000000000000";
          secondary-color = "#000000000000";
        };

        "org/gnome/desktop/screensaver" = {
          picture-uri = "${wallpaper}";
          primary-color = "#000000000000";
          secondary-color = "#000000000000";
        };

	"org/gnome/desktop/notifications" = {
          show-in-lock-screen = false;
	};

	"org/gnome/mutter" = {
          edge-tiling = true;
	  dynamic-workspaces = true;
	};

	"org/gnome/desktop/privacy" = {
          recent-files-max-age = 30;
          remove-old-trash-files = true;
	  remove-old-temp-files = true;
	};

	"org/gnome/desktop/sound" = {
          event-sounds = false;
	};
      };
    }
