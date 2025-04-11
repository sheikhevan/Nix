{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.networking.wireless = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable wireless networking with iwd and NetworkManager?
        '';
      };
    };
  };
  config = mkIf config.evan.networking.wireless.enable {
    networking.networkmanager = {
      enable = true;
      wifi = {
	backend = "iwd";
	macAddress = "random";
      };
    };
  };
}

