{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.networking.firewall = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the firewall?
        '';
      };
    };
  };
  config = mkIf config.evan.networking.firewall.enable {
    networking.firewall.enable = true;
  };
}

