###
### Backup services
###
### Using restic with rclone. 'rclone config' to setup repositories used by restic
### Don't encryp rclone config, restic had problems decrypting it
### 'restic -r rclone:<name>:/data snapshots' to show a list with snapshots
### 'restic -r rclone:<name>:/data restore <id/last> --target <path>' to restore
###

inputs: let
  user = "${inputs.user}";			# Will search for rclone config in home directory
  initialize = true;				# Create the directory if it does not exist
  paths = ["${inputs.data}"];			# Store my data partition
  exclude = ["${inputs.data}/projects"];	# Exclude projects stored on github
  timerConfig = {
    OnCalendar = "daily"; 			# Run daily
    Persistent = true; 				# Run backup if you were inactive on triggering
  };
  pruneOpts = ["--keep-daily 7"];		# How many snapshots i want to keep
  passwordFile = "${inputs.home}/backup-password"; # Repository password is stored in a file
in {
  ### PACKAGES ###
  environment.systemPackages = with inputs.pkgs; [
    rclone
    restic
  ];

  ### SERVICES ###
  services.restic.backups = {
    onedrive = {
      repository = "rclone:onedrive:data";
      inherit user initialize paths exclude timerConfig pruneOpts passwordFile;
    };

    googledrive = {
      repository = "rclone:googledrive:data";
      inherit user initialize paths exclude timerConfig pruneOpts passwordFile;
    };
  };
}
