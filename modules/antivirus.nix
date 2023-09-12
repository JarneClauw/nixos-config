###
### Antivirus configuration
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [ clamav ];

  services.clamav = {
    daemon.enable = true; 	# Enable clamd
    updater.enable = true;	# Update freshclam automatically
  };

  systemd.timers.clamscan = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "clamscan.service";
    };
  };

  systemd.services.clamscan = {
    script = "${inputs.pkgs.clamav}/bin/clamscan -r --quiet --move=${inputs.home}/infected ${inputs.home}";
  };
}
