{ config, pkgs, ... }:

{
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # 로지텍 마우스 동글 절전모드에서 깨어나지 못하도록 수정
  services.udev.extraRules = ''
    #disable Logitech Bolt Dongle wake up from suspend
    ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c548", ATTR{power/wakeup}="disabled"
  '';
}

