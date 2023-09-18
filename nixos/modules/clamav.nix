###
### Clam AntiVirus configuration
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [ clamav ];

  services.clamav = {
    daemon.enable = true; 	# Enable clamd
    updater.enable = true;	# Update the database
  };

  ### AUTOMATIC SCAN ###
  systemd.timers.clamscan = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "clamscan.service";
    };
  };

  systemd.services.clamscan = {
    script = "${inputs.pkgs.cpulimit}/bin/cpulimit --limit=25 -- ${inputs.pkgs.clamav}/bin/clamscan --infected --recursive --move=${inputs.home}/infected ${inputs.home}";
  };
}
