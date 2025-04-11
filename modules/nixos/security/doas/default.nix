{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.security.doas = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'doas' for privilege escalation?
        '';
      };

      users = mkOption {
        type = types.listOf types.str;
        default = ["evan"];
        description = ''
          Which user(s) should use 'doas'?
        '';
      };
    };
  };
  config = mkIf config.evan.security.doas.enable {
    security.doas.enable = true;
    security.sudo.enable = false;
    security.doas.extraRules = [{
      users = config.evan.security.doas.users;
      keepEnv = true; 
      persist = true;
    }];
  };
}

