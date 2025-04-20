{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.security.madaidan-boot = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable madaidan's boot parameter configuration?
        '';
      };
    };
  };
  config = mkIf config.evan.security.madaidan-boot.enable {
    boot.kernelParams = [
      "slab_nomerge"
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "pti=on"
      "vsyscall=none"
      "debugfs=off"
      "oops=panic"
      "module.sig_enforce=1"
      "lockdown=confidentiality"
      "mce=0"
      "quiet"
      "loglevel=0"
    ];
  };
}

