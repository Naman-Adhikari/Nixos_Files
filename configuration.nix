
{lib, confit, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.


  networking.networkmanager.enable = true;
  
 services.passSecretService.enable = true;
 
  
  #Enabling hyprlnd on NixOS
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
 };



 #Enabling NIRI
 services.displayManager.sessionPackages = [ pkgs.niri ];
 programs.xwayland.enable = true;




services.xserver.videoDrivers = ["nvidia"];
nix.settings.experimental-features = [ "nix-command" "flakes"];

services.ollama.enable = true;
services.ollama.acceleration = "cuda";
nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
"nvidia-x11"
#for ollama
"cuda_cudart"
"libcublas"
"cuda_cccl"
"cuda_nvcc"
];



  environment.sessionVariables = {
  # WLR_NO_HARDWARE_CURSORS = "1";
   EDITOR = "nvim";
   VISUAL = "nvim";
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
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


hardware.bluetooth.enable = true;
  services.printing.enable = true;
  

  services.power-profiles-daemon.enable = false;



  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;


  };


  users.users.lostfromlight = {
    isNormalUser = true;
    description = "Naman Adhikari";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  programs.firefox.enable = true;

  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    waybar
    kitty
    gimp
    obs-studio
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
    blender
    hyprlock
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
    mpvpaper
    mpv
    starship
    bluetui
    ghostty
    fastfetch
    yazi
    gparted
    niri
    nemo
    unetbootin
    swaybg
    xwayland-satellite
    eww
    waypaper
    ollama


 ];

}





