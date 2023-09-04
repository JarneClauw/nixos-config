###
### Clam AntiVirus system configuration
###

inputs: {
  services.clamav = {
    daemon.enable = true;	# Enable clamd
    updater.enable = true; 	# Update freshclam
  };

  # Scan home directory every night and move them to ~/infected/
  services.cron.systemCronJobs = [
    "0 0 * * * clamscan -r --quiet --move=/home/${inputs.user}/infected /home/${inputs.user}"
  ];
}
