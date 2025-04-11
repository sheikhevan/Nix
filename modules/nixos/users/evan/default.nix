{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.users.evan = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the 'evan' user?
        '';
      };
    };
  };
  config = mkIf config.evan.users.evan.enable {
    users.users.evan = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ or ‘doas’ for the user.
      packages = with pkgs; [];
    };
  };
}

