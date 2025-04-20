{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.programs.zathura = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the zathura reader?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.zathura.enable {
    programs.zathura = {
      enable = true;
      extraConfig = ''
        set adjust-open "best-fit"
        set selection-clipboard clipboard
        set guioptions ""
        
        set recolor true
        map i recolor
        map [fullscreen] i recolor
        
        set render-loading "false"
        unmap f
        map f toggle_fullscreen
        map [fullscreen] f toggle_fullscreen
        
        set font "Liga SFMono Nerd Font 14"
        
        # Oxocarbon theme
        set completion-bg "#393939"
        set completion-fg "#ff7eb6"
        set completion-highlight-bg "#ff7eb6"
        set completion-highlight-fg "#393939"
        set highlight-active-color "#42be65"
        set highlight-color "#ee5396"
        set index-active-bg "#42be65"
        set inputbar-bg "#161616"
        set inputbar-fg "#f2f4f8"
        set notification-bg "#78a9ff"
        set notification-error-bg "#3ddbd9"
        set notification-error-fg "#161616"
        set notification-fg "#161616"
        set notification-warning-bg "#3ddbd9"
        set notification-warning-fg "#161616"
        set recolor "true"
        set recolor-darkcolor "#ffffff"
        set recolor-keephue "true"
        set selection-clipboard "clipboard"
        set statusbar-bg "#262626"
        
        # set default-bg "#161616"
        # set recolor-lightcolor "#161616"
        set default-bg rgba(0,0,0,0.7)
        set recolor-lightcolor rgba(255,255,255,0)
      '';
    };
  };
}


