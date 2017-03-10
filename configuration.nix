# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
   i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "br-abnt2";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Belem";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [

     #prog
     vimHugeX gitMinimal brackets nodejs lua5_0
     python27Packages.pip python27Packages.virtualenv
     python35Packages.virtualenv python35Packages.pip
     mysqlWorkbench

     #util
     wget firefox xfce.thunar rxvt_unicode compton-git
     nox sxiv xfce.xfce4taskmanager leafpad xbindkeys
     brackets nodejs rofi fzf tilda

     #appearance
     feh screenfetch paper-icon-theme lxappearance i3status
     vanilla-dmz gtk-engine-murrine 
  ];

  #fonts
  fonts = {
     enableFontDir = true;
     enableGhostscriptFonts = true;
     fonts = with pkgs; [
       inconsolata  # monospaced
       ubuntu_font_family  # Ubuntu fonts
       unifont # some international languages
       meslo-lg
       dina-font
       font-awesome-ttf
     ];
   };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  #unclutter
  services.unclutter.enable = true;

  #shell
  programs.zsh.enable = true;
  
  #sql
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "br";
  services.xserver.windowManager.i3-gaps.enable = true;
  services.xserver.windowManager.default= "i3-gaps";
  services.xserver.resolutions = [ { x = 1336; y = 768; }];
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.kassio= {
    isNormalUser = true;
    home="/home/kassio";
    shell= pkgs.zsh;
    extraGroups=[ "wheel" ];
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
