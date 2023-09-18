###
### VSCodium configuration
###

inputs: {
  programs.vscode = {
    enable = true;
    package = inputs.pkgs.vscodium;

    extensions = with inputs.vscode-extensions; [
      vscode-marketplace.teabyii.ayu
      vscode-marketplace.pkief.material-icon-theme
      vscode-marketplace.csstools.postcss
      vscode-marketplace.svelte.svelte-vscode
      vscode-marketplace.jnoortheen.nix-ide
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
      # Disable updates
      "update.mode" = "none";
      "update.showReleaseNotes" = false;
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = "none";
      # Auto pair brackets
      "editor.linkedEditing" = true;
      # Svelte TypeScript support
      "svelte.enable-ts-plugin" = true;
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
