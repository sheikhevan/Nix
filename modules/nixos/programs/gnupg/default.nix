{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.programs.gnupg = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the gnupg program?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.gnupg.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}

