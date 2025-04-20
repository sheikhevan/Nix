{ lib, config, pkgs, inputs, ... }:
with lib; {
  options = {
    evan.programs.nvf = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the nvf neovim configuration layer?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.nvf.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      plugins = [ pkgs.rofi-emoji-wayland ];
      font = "SFProDisplay Nerd Font";
    };
  };
}

