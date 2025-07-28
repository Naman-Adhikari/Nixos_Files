
{lib, confit, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["mem_sleep_default=deep"];

  networking.hostName = "proxy-pc"; # Define your hostname.


  networking.networkmanager.enable = true;
 networking.networkmanager = {
    dns = "none";  
  };

  environment.etc."resolv.conf".text = ''
    nameserver 1.1.1.1
    nameserver 8.8.8.8
    options edns0
  '';

 services.passSecretService.enable = true;
 
  
  #Enabling hyprlnd on NixOS
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
 };

#For mpd

#   services.mpd = {
#    enable = true;
#    musicDirectory = "/home/lostfromlight/Music";
#    user = "lostfromlight";

#    extraConfig = ''
#	  auto_update "yes"
#	  restore_paused "yes"
#	  mixer_type "software"

#	  audio_output {
#	    type "pulse"
#	    name "PulseAudio Output"

#	  }

#	  audio_output {
#	    type "fifo"
 #   name "ncmpcpp visualizer"
#	    path "/tmp/mpd.fifo"
#	    format "44100:16:1"
#	  }

#	'';
#

 # };


 #Enabling NIRI
 services.displayManager.sessionPackages = [ pkgs.niri ];
 programs.xwayland.enable = true;


#Disable nvidia gpu to enter integrated mode (uncomment to enable nvidia)
#boot.blacklistedKernelModules = [ "nvidia" "nvidia_drm" "nvidia_modeset" "nvidia_uvm" ];

#powertop config
#systemd.services.powertop = {
#  description = "Apply Powertop Tunings on Boot";
 # wantedBy = [ "multi-user.target" ];
#  after = [ "multi-user.target" ];
#  serviceConfig = {
#    Type = "oneshot";
#    ExecStart = "${pkgs.powertop}/bin/powertop --auto-tune";
#  };
  # Optional: run only on battery
#  unitConfig.ConditionACPower = false;
#};

programs.fish.enable = true;
users.users.lostfromlight = {
  shell = pkgs.fish;
};



services.xserver.videoDrivers = ["nvidia"];
nix.settings.experimental-features = [ "nix-command" "flakes"];

services.ollama.enable = true;
#services.ollama.acceleration = "cuda";
nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "cuda_cudart"
  "libcublas"
  "cuda_cccl"
  "cuda_nvcc"
  "nvidia-x11"
  "nvidia-settings"
  "libnvoptix"
];


  environment.sessionVariables = {
  # WLR_NO_HARDWARE_CURSORS = "1";
   EDITOR = "nvim";
   VISUAL = "nvim";
   BROWSER = "librewolf";
   DEFAULT_BROWSER = "librewolf";
   NIXOS_OZONE_WL = "1";
   STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
 };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.open = false;
    nvidia.nvidiaSettings = true;
};

services.flatpak.enable = true;


services.tlp.enable = true;
services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    DISK_IDLE_SECS_ON_AC = 300;                
    DISK_IDLE_SECS_ON_BAT = 60;            
    USB_AUTOSUSPEND = 1;                   
    PCIE_ASPM_ON_BAT = "powersave";
    STOP_CHARGE_THRESH_BAT0 = 80;
};

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "lostfromlight";
  services.displayManager.defaultSession = "hyprland";
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


hardware.bluetooth.enable = true;
  services.printing.enable = true;
  

  services.power-profiles-daemon.enable = false;


  services.pipewire.wireplumber.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;


  };
systemd.user.services.xdg-desktop-portal.enable = true;
systemd.user.services.xdg-desktop-portal-wlr.enable = true;

  users.users.lostfromlight = {
    isNormalUser = true;
    description = "Naman Adhikari";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.firefox.enable = true;

  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    waybar
    kitty
    gimp
    vlc
    audacity
    jp2a
    hyprland
    rofi-wayland
    hyprpaper
    brightnessctl
    grim
    slurp
    wl-clipboard
    imv
    github-desktop
    git
    fish
    pywal    
    obsidian
    inotify-tools
    psmisc
    neovim 
    pavucontrol
    python311
    tlp
    flatpak
    luajit
    hyprlock
    ghostty
    hypridle
    gcc
    protonup
    tmux
    lmms
    pulseaudio
    python311Packages.pyinstaller
    copyq
    libreoffice-qt6
    lua-language-server
    desktop-file-utils
    mpv
    starship
    fastfetch
    yazi
    gparted
    niri
    unetbootin
    xwayland-satellite
    waypaper
    ollama
    atuin
    btop
    toipe
    curl
    playerctl
    cava
    powertop
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    kooha
    wf-recorder
    floorp
    hyprsunset
    hyprcursor
    zoxide
    direnv
    bibata-cursors
    glib
    octaveFull
    libnotify
    mpd
    mpc
    ncmpcpp
    jq
    pyprland
    dunst



 ];

}





