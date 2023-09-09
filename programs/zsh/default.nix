###
### ZSH configuration
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
      ll = "lsd -l";
      la = "lsd -la";
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

    initExtra = ''
      source ~/.p10k.zsh
    '';
  };
}
