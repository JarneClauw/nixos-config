###
### Antivirus configuration
###

inputs: {
  environment.systemPackages = with inputs.pkgs; [ clamav ];

  services.clamav = {
    daemon.enable = true; 	# Enable clamd
    updater.enable = true;	# Update freshclam automatically
  };

  # Scan home every night and move infected files to ~/infected/
  services.cron.systemCronJobs = [
    "0 0 * * * clamscan -r --quiet --move/home/${inputs.user}/infected /home/${inputs.user}"
  ];
}
