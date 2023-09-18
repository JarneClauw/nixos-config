###
### Firefox configuration
###
### Finding a way to remove the old config since switching with it throws errors
###

inputs: {
  programs.firefox = {
    enable = true;

    profiles.${inputs.user} = {
      isDefault = true;
      search.default = "Google";
      
      extensions = with inputs.pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
	youtube-recommended-videos
  	bitwarden
      ];
      
      settings = {
        "browser.tabs.firefox-view" = false; # Remove firefox view
	"browser.startup.page" = 3; # Restore session
	"browser.shell.checkDefaultBrowser" = false; # Don't check if default browser
	"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false; # Remove shortcuts form newtabpage
	"extensions.pocket.enabled" = false; # Remove pocket extension
	"browser.tabs.tabmanager.enabled" = false; # Remove the tabs manager
        # DRM content
	# Don't recommend extensions and features as i browse
	# Remove web search in home
	# Removing some search shortcuts
	# Don't ask for a password
	# Https only
      };

      bookmarks = [
        {
          toolbar = true;
	  bookmarks = [
        {
          name = "UGent";
	  bookmarks = [
            { name = "Ufora"; url = "https://ufora.ugent.be/d2l/home"; }
	    { name = "OASIS"; url = "https://oasis.ugent.be/oasis-web/inbox/home"; }
	    { name = "GitHub (UGent)"; url = "https://github.ugent.be"; }
	    { name = "TimeEdit"; url = "https://cloud.timeedit.net/ugent/web/student/ri1Y435Q975Z61Q29.html"; }
	    { name = "Outlook"; url = "https://outlook.office365.com/mail/"; }
	  ];
	}
	{
          name = "Projects";
	  bookmarks = [
            { name = "GitHub"; url = "https://github.com/JarneClauw"; }
	    { name = "Advent of Code"; url = "https://adventofcode.com"; }
	    { name = "Vercel"; url = "https://vercel.com/dashboard"; }
	    { name = "Supabase"; url = "https://supabase.com/dashboard"; }
	    { name = "ChatGPT"; url = "https://chat.openai.com"; }
	    { name = "CrackMes"; url = "https://crackmes.one"; }
	    { name = "ChooseALicense"; url = "https://choosealicense.com"; }
	    {
              name = "CTF";
	      bookmarks = [
                { name = "VulnHub"; url = "https://vulnhub.com"; }
		{ name = "OverTheWire"; url = "https://overthewire.org"; }
		{ name = "PicoCTF"; url = "https://picoctf.org"; }
		{ name = "TryHackMe"; url = "https://tryhackme.com"; }
	      ];
	    }
	  ];
	}
	{
          name = "Entertainement";
	  bookmarks = [
            { name = "YouTube"; url = "https://youtube.com"; }
	    { name = "Netflix"; url = "https://netflix.com/browse"; }
	    { name = "Disney+"; url = "https://disneyplus.com"; }
	    { name = "Reddit"; url = "https://reddit.com"; }
	    { name = "PokeOne"; url = "https://pokeonecommunity.com"; }
	    { name = "NintendoDSROMCollection"; url = "https://archive.org/download/NintendoDSRomCollectionByGhostware"; }
	  ];
	}
        {
          name = "Package Managers";
	  bookmarks = [
            { name = "Nix"; url = "https://search.nixos.org"; }
	    { name = "NUR"; url = "https://nur.nix-community.org"; }
	    { name = "Arch"; url = "https://archlinux.org/packages"; }
	    { name = "AUR"; url = "https://aur.archlinux.org"; }
	  ];
	}
	{
          name = "Manuals";
	  bookmarks = [
            { name = "Nix Manual"; url = "https://nixos.org/manual/nix"; }
	    { name = "Nix Pills"; url = "https://nixos.org/guides/nix-pills"; }
	    { name = "Nixos Manual"; url = "https://nixos.org/manual/nixos"; }
	    { name = "HomeManager Manual"; url = "https://nix-community.github.io/home-manager"; }
	    { name = "Arch Wiki"; url = "https://wiki.archlinux.org"; }
	  ];
	}
	{
          name = "Library";
	  bookmarks = [
            { name = "Gamma for every coder"; url = "https://blog.johnnovak.net/2016/09/21/what-every-coder-should-know-about-gamma/"; }
	    { name = "Qiskit"; url = "https://qiskit.org/"; }
	    { name = "Photo Editor"; url = "https://photopea.com"; }
	    { name = "12ft Ladder"; url = "https://12ft.io"; }
	  ];
	}
	{ name = "OneDrive"; url = "https://onedrive.live.com"; }
	{ name = "GoogleDrive"; url = "https://drive.google.com/drive/my-drive"; }
	];}
      ];
    };
  };
}
