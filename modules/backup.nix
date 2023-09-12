###
### Backup services
###
### Using restic with rclone. 'rclone config' to setup repositories used by restic
### 'restic -r rclone:<name>:/data snapshots' to show a list with snapshots
### 'restic -r rclone:<name>:/data restore <id/last> --target <path>' to restore
###

inputs: let
  user = "${inputs.user}";			# Will search for rclone config in roots home directory
  paths = ["${inputs.dataDir}"];		# Store my data partition
  initialize = true;				# Create dir if it does not exist
  timerConfig = {
    OnCalendar = "daily"; 			# Run daily
    Persistent = true; 				# Run backup because you were inactive
  };
  pruneOpts = ["--keep-daily 7"];		# How many snapshots i need
  exclude = ["${inputs.dataDir}/projects"];	# Exclude certian files
  passwordFile = "${inputs.home}/restic-repo-password"; # Repository password is stored in a file
in {
  # Adding the necessary packages
  environment.systemPackages = with inputs.pkgs.unstable; [
    rclone
    restic
  ];

  # Adding the configuration
  services.restic.backups = {
    OneDrive = {
      repository = "rclone:OneDrive:/data";
      inherit paths initialize timerConfig pruneOpts exclude passwordFile user;
    };
  };
}
