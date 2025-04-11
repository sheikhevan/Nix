{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.programs.ghostty = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the ghostty terminal?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.ghostty.enable {
    programs.ghostty = {
      enable = true;
      settings = {
	theme = "Oxocarbon";
	window-padding-x = 10;
	window-padding-y = 10;
      };
    };
  };
}


