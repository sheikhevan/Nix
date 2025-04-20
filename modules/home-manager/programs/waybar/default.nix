{ lib, config, pkgs, ... }:
with lib; {
  options = {
    evan.programs.waybar = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable the waybar program?
        '';
      };
    };
  };
  
  config = mkIf config.evan.programs.waybar.enable {
    programs.waybar = {
      enable = true;
      style = ''
        * {
            border: none;
            border-radius: 0px;
            font-family: "SFProDisplay Nerd Font";
            font-weight: bold;
            font-size: 16px;
            min-height: 0;
        }
        
        window#waybar {
            border-radius: 20px;
            background: rgba(22, 22, 22, 0.1);
        }
        
        tooltip {
            background: #161616;
            border-radius: 10px;
            border: 1px solid #78a9ff;
        }
        
        tooltip label {
            color: #dde1e6;
        }
        
        #workspaces {
            background: rgba(38, 38, 38, 0.2);
            border-radius: 20px;
            margin: 6px 0px;
            padding: 0 10px;
        }
        
        #workspaces button {
            padding: 0px;
            color: rgba(221, 225, 230, 0.5);
            background: transparent;
            border-radius: 10px;
            margin: 6px 0px;
            padding: 0 12px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
        }
        
        #workspaces button.active {
            background: rgba(38, 38, 38, 0.2);
            color: #78a9ff;
            border-radius: 20px;
            transition: color 0.5s;
            margin: 6px 0px;
            padding: 0 15px;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.8s cubic-bezier(0.55, -0.68, 0.48, 1.682);
        }
        
        #workspaces button.focused {
            color: #78a9ff;
            background: transparent;
        }
        
        #workspaces button.urgent {
            color: #ee5396;
            background: transparent;
        }
        
        #workspaces button:hover {
            background: transparent;
            color: #78a9ff;
        }
        
        #window,
        #clock,
        #battery,
        #network,
        #memory,
        #bluetooth,
        #pulseaudio,
        #workspaces {
            padding: 0 16px;
            margin: 6px 0px;
        }
        
        #window {
            margin-left: 60px;
            margin-right: 60px;
            background: rgba(38, 38, 38, 0.3);
            border-radius: 10px;
            color: #78a9ff;
        }
        
        #clock {
            color: #78a9ff;
            background: transparent;
        }
        
        #network {
            color: #78a9ff;
            background: transparent;
        }
        
        #bluetooth {
            color: #78a9ff;
            background: transparent;
        } 
        
        #battery {
            color: #78a9ff;
            background: transparent;
        }
        
        #pulseaudio {
            color: #78a9ff;
            background: transparent;
        }

	#cava {
            padding: 0 6px;
            color: #78a9ff;
            background: transparent;
            font-family: monospace;
        }
        
        #memory {
            color: #78a9ff;
            background: transparent;
        }
        
        #calendar {
            background: #161616;
            border-radius: 10px;
            padding: 10px;
            font-family: "SFProDisplay Nerd Font";
        }
      '';
      settings = [{
        layer = "top";
        position = "top";
        margin = "8 12 0";
        "fixed-center" = true;
        reload_style_on_change = true;
        height = 34;
        width = 600;
        spacing = 8;
        "modules-left" = ["clock"];
        "modules-center" = ["hyprland/workspaces"];
        "modules-right" = ["pulseaudio" "group/custom-group"];

        "hyprland/workspaces" = {
          format = "{icon}";
          "on-click" = "activate";
          "all-outputs" = true;
          "format-icons" = {
            default = "󰫣 ";
            active = "󰫢 ";
          };
        };

        clock = {
          format = "{:%I:%M %p}";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          "format-charging" = "󱐋 {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        network = {
          "format-wifi" = "{icon} {essid}";
          "format-ethernet" = "󰈀 {ifname}";
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = "󰖪 Disconnected";
          "format-icons" = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
          ];
        };

        bluetooth = {
          format = "󰂯 {status}";
          "format-disabled" = "󰂲";
          "format-connected" = "󰂱 {num_connections}";
          "tooltip-format" = "{device_alias}";
          "tooltip-format-connected" = "󰂱 {device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "󰏲";
            portable = "󰓃";
            car = "󰄋";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
        };

	"cava" = {
	  "cava_config" = "/home/evan/.config/cava/config";
          framerate = 30;
          autosens = 1;
          sensitivity = 3;
          bars = 6;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pulse";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.5;
          input_delay = 2;
          "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          actions = {
            "on-click-right" = "mode";
          };
        };

        "group/custom-group" = {
          orientation = "inherit";
          drawer = {
            "transition-duration" = 500;
            "transition-left-to-right" = true;
          };
          modules = [
            "battery"
            "network"
            "bluetooth"
          ];
        };
      }];
    };
  };
}
