{ config, pkgs, ... }:

{
  # 프린팅 서비스(CUPS) 활성화
  services.printing = {
    enable = true;
    drivers = [ pkgs.samsung-unified-linux-driver ];
  };

  # 네트워크 프린터(네트워크 상의 프린터를 자동으로 찾기 위함) 자동 감지 활성화
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}

