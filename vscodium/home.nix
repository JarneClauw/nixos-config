###
### VS Code configuration
###

{ pkgs, vscode-extensions, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with vscode-extensions; [
      vscode-marketplace.teabyii.ayu
      vscode-marketplace.pkief.material-icon-theme
    ];

    # Go to settings, click the wheel icon, select copy ID
    userSettings = {
      # Autosave my files
      "files.autoSave" = "afterDelay";
      # Themes and icons
      "workbench.colorTheme" = "Ayu Mirage";
      "workbench.iconTheme" = "material-icon-theme";
      # Terminal
      "terminal.external.linuxExec" = "alacritty";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.cursorStyle" = "line";
      "editor.fontFamily" = "Hack Nerd Font";
      # Remove the titlebar
      "window.titleBarStyle" = "custom";
      # Never ask "do you trust this workspace"
      "security.workspace.trust.startupPrompt" = "never";
      # Don't show a startpage
      "workbench.startupEditor" = "none";
    };

    globalSnippets = {
      fixme = {
        prefix = ["fixme"];
	body = ["$LINE_COMMENT FIXME: $0"];
	description = "Add FIXME comment";
      };
    };
  };
}
