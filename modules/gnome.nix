###
### Gnome configuration
###

inputs: {
  ### GNOME DESKTOPMANAGER ###
  services.xserver.desktopManager.gnome.enable = true;

  ### REMOVE DEFAULT PACKAGES ### 
  environment.gnome.excludePackages = with inputs.pkgs.gnome; [
    cheese		# Photo booth
    epiphany		# Web browser
    gedit		# Text editor
    totem		# Video player
    yelp		# Help viewer
    evince		# Document viewer
    geary		# Email client
    seahorse		# Password manager
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    inputs.pkgs.gnome-photos
    gnome-weather
    inputs.pkgs.gnome-connections
    inputs.pkgs.gnome-tour
  ];
}
