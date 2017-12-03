{ pkgs, ... }:

let
  secrets = import ../secrets.nix;
in
{
  environment.systemPackages = with pkgs; [
    acpi # Show battery status and other ACPI information
    arandr # manage dispays
    axel #  Console downloading program with some features for parallel connections for faster downloading
    mutt # A small but very powerful text-based mail client
    termite # A simple VTE-based terminal
    weechat # A fast, light and extensible chat client
    powertop # Analyze power consumption on Intel-based laptops
    openvpn # A robust and highly flexible tunneling application
    update-resolv-conf # Script to update your /etc/resolv.conf with DNS settings that come from the received push dhcp-options pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
    chromium # An open source web browser from Google
    cura # 3D printer / slicing GUI built on top of the Uranium framework
    corebird # twitter client
    electrum # bitcoin thin-client
    evince # gnome document viewer
    firefox # A web browser built from Firefox source tree
    freecad # General purpose Open Source 3D CAD/MCAD/CAx/CAE/PLM modeler
    gnupg # encryption
    google-chrome # google chrome browser
    google-drive-ocamlfuse # FUSE-based file system backed by Google Drive
    gtypist # typing practice
    gimp # Image Manipulation Program
    hfsprogs # HFS user space utils, for mounting HFS+ osx partitions
    inkscape # vector graphics editor
    keepassx2 # password managment
    keychain # Keychain management tool
    libnotify # send notifications to a notification daemon
    libreoffice # Comprehensive, professional-quality productivity suite
    lm_sensors # Tools for reading hardware sensors
    openscad # 3D parametric model compiler
    pamixer # cli tools for pulseaudio
    pcmanfm # File manager witth GTK+ interface
    pidgin-with-plugins # Multi-protocol instant messaging client
    pidginwindowmerge # merge contacts and message window
    purple-plugin-pack # Plugin pack for Pidgin 2.x
    pinentry # gnupg interface to passphrase input
    polkit # A dbus session bus service that is used to bring up authentication dialogs
    printrun # 3d printing host software
    pythonPackages.udiskie # Removable disk automounter for udisks
    pythonPackages.youtube-dl # Command-line tool to download videos from YouTube.com and other sites
    qalculate-gtk # The ultimate desktop calculator
    scrot # screen capturing
    slic3r # G-code generator for 3D printers
    sxiv # image viewer
    surf # suckless browser
    tesseract # OCR engine
    thunderbird # email client
    utox # Lightweight Tox client
    xarchiver # GTK+ frontend to 7z,zip,rar,tar,bzip2, gzip,arj, lha, rpm and deb (open and extract only)
    xclip # clipboard
    xdg_utils # Set of cli tools that assist applications integration
    xpdf # pdf viewer
    xsel # Command-line program for getting and setting the contents of the X selection
    xsettingsd # Provides settings to X11 applications via the XSETTINGS specification
  ];

  nixpkgs.config = {
    allowUnfree = true;
    nixpkgs.config.packageOverrides = pkgs: {
      inherit (import ../packages { inherit pkgs; }) custom;
    };
  };
}