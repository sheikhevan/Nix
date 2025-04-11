{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.programs.hyprland = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the Hyprland window manager?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.hyprland.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}

