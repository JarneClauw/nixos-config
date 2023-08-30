###
### Z shell configuration
###

{
  programs.zsh = {
    enable = true;
    
    ### BASICS ###
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    ### HISTORY ###
    history = {
      extended = true;
    };
    historySubstringSearch.enable = true;

    ### ALIASES ###
    shellGlobalAliases = {
      ls = "lsd";
      vim = "nvim";
      scan = "~/scan.sh";
    };

    ### PLUGINS ###
    zplug = {
      enable = true;
      plugins = [
        { name = "MichaelAquilina/zsh-you-should-use"; }
	{ name = "romkatv/powerlevel10k"; tags = [ "as:theme" ]; }
      ];
    };
  };
}
