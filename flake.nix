{
  description = "sheikhevan's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon?rev=f51de44b1d720ac23e838db8e0cf13fadb7942b8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
  };

  outputs = { self, nixpkgs, apple-silicon, home-manager, ... }@inputs: {
    nixosConfigurations.hydrogen = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/hydrogen/configuration.nix
	apple-silicon.nixosModules.apple-silicon-support
	home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

	    home-manager.backupFileExtension = "bak";

            home-manager.users.evan = import ./hosts/hydrogen/home.nix;

	    home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
