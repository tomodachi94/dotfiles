{
  nix = {
	settings = {
	  experimental-features = [
	    "nix-command"
		"flakes"
	  ];
	  auto-optimise-store = true;
	};
	gc = {
	  automatic = true;
      dates = "weekly";
	  options = "--delete-old --delete-older-than 14d";
	};
  };
}
