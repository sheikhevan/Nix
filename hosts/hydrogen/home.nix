{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/window-managers/hyprland
    ../../modules/home-manager/programs/firefox
    ../../modules/home-manager/programs/ghostty
  ];
  home.username = "evan";
  home.homeDirectory = "/home/evan";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  home.packages = with pkgs; [
    fastfetch

    zip
    xz
    unzip
    p7zip

    ripgrep
    jq
    yq-go
    eza
    fzf

    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd

    strace
    ltrace
    lsof

    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
    vulkan-tools
    
    obsidian
    ungoogled-chromium
    inputs.zen-browser.packages.${system}.beta
  ];

  programs.git = {
    enable = true;
    userName = "Evan Alvarez";
    userEmail = "evanfalvarez@tutamail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  evan.windowManagers.hyprland.enable = true;

  evan.programs.ghostty.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
