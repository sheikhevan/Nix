{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.basics = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable basic system settings?
        '';
      };

      asahi = mkOption {
        type = types.bool;
        default = false;
        description = ''
	  Are you using Asahi Linux?
        '';
      };

      hostname = mkOption {
        type = types.str;
        default = "machine";
        description = ''
	  What is the hostname?
        '';
      };
    };
  };
  config = mkIf config.evan.basics.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = !config.evan.basics.asahi;

    hardware.asahi = mkIf config.evan.basics.asahi {
      peripheralFirmwareDirectory = ./asahi/firmware;
      withRust = true;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "replace";
      setupAsahiSound = true;
    };

    time.timeZone = "America/Chicago";
    i18n.defaultLocale = "en_US.UTF-8";

    networking.hostName = config.evan.basics.hostname;
  };
}

