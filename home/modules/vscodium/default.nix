###
### VSCodium configuration
###

inputs: {
  programs.vscode = {
    enable = true;
    package = inputs.pkgs.unstable.vscodium;

    # nix repl
    # :lf github:nix-community/nix-vscode-extensions
    # t = extensions.x86_64-linux
    # t.<TAB>
    extensions = with inputs.vscode-extensions; [
      # Themes and icons
      vscode-marketplace.teabyii.ayu
      vscode-marketplace.pkief.material-icon-theme
      # JS/TS/HTML/CSS
      vscode-marketplace.csstools.postcss
      vscode-marketplace.svelte.svelte-vscode
      # NIX
      vscode-marketplace.jnoortheen.nix-ide
      vscode-marketplace.mkhl.direnv
      # C/C++
      vscode-marketplace.llvm-vs-code-extensions.vscode-clangd
      vscode-marketplace.twxs.cmake
      # Python
      vscode-marketplace.ms-python.python
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
      todo = {
        prefix = ["todo"];
	body = ["$LINE_COMMENT TODO: $0"];
	description = "Add TODO comment";
      };
    };
  };
}
