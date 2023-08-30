###
### Git configuration
###

{
  programs.git = {
    enable = true;
    
    ### GENERAL ###
    userName = "Jarne Clauw";
    userEmail = "jarne@clauw.eu";

    ### ALIASES ###
    aliases = {
      discard = "restore";
      unstage = "restore --staged";
      graph = "log --graph";
    };
    
    ### GLOBAL IGNORES ###
    ignores = [ "*.env" ];
    
    ### OTHER ####
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      push.autoSetupRemote = true;
      pull.rebase = false;
    };

    ### PLUGINS ###
    difftastic.enable = true;
  };
}
