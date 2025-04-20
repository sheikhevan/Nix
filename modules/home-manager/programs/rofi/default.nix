{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.programs.rofi = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the rofi program?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      plugins = [ pkgs.rofi-emoji-wayland ];
      font = "SFProDisplay Nerd Font";
    };
  };
}

