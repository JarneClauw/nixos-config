###
### Gnome settings configuration
###

inputs:
  let
    wallpaper = "file://" + ../../wallpapers/bears.png;
  in
    {
      dconf.settings = {
        ### GENERAL ###
        "org/gnome/interface" = {
          color-scheme = "prefer-dark";
	  enable-hot-corners = false;
	  show-battery-percentage = true;
        };

	"org/gnome/desktop/notifications" = {
          show-in-lock-screen = false;
	};

	"org/gnome/desktop/sound" = {
          event-sounds = false;
	};
        
	### BACKGROUND & SCREENSAVER ###
        "org/gnome/desktop/background" = {
          picture-uri = "${wallpaper}";
          picture-uri-dark = "${wallpaper}";
          primary-color = "#255000000000";
          secondary-color = "#255000000000";
        };

        "org/gnome/desktop/screensaver" = {
          picture-uri = "${wallpaper}";
          primary-color = "#255000000000";
          secondary-color = "#255000000000";
        };

        ### WORKSPACES ###
	"org/gnome/mutter" = {
          edge-tiling = true;
	  dynamic-workspaces = true;
	};
        
	### TEMP FILES & HISTORY ###
	"org/gnome/desktop/privacy" = {
	  remember-recent-files = true;
          recent-files-max-age = 30;

          remove-old-trash-files = true;
	  remove-old-temp-files = true;
	  old-files-age = 30;
	};
      };
    }
