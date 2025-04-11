{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.nix = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable Evan's custom nix configuration?
        '';
      };
    };
  };
  config = mkIf config.evan.nix.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.auto-optimise-store = true;
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "obsidian"
    ];
  };
}


