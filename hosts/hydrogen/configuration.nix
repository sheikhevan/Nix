# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/common/nix
      ../../modules/nixos/basics
      ../../modules/nixos/networking/wireless
      ../../modules/nixos/networking/firewall
      ../../modules/nixos/users/evan
      ../../modules/nixos/security/doas
      ../../modules/nixos/security/madaidan-sysctl
      ../../modules/nixos/security/madaidan-boot
      ../../modules/nixos/services/pipewire
      ../../modules/nixos/services/greetd
      ../../modules/nixos/programs/gnupg
    ];
  evan.nix.enable = true;

  evan.basics = {
    enable = true;
    asahi = true;
    hostname = "hydrogen";
  };
  
  evan.networking = {
    wireless.enable = true;
    firewall.enable = true;
  };

  evan.users.evan.enable = true;

  evan.security.doas = {
    enable = true;
    users = ["evan"];
  };
  evan.security.madaidan-sysctl.enable = true;
  evan.security.madaidan-boot.enable = true;


  evan.services.pipewire.enable = true;

  evan.programs.gnupg.enable = true;

  services.logrotate.checkConfig = false;

  programs.neovim.enable = true;
  programs.hyprland.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

