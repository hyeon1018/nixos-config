{ config, pkgs, ... }:

{
  # 1. 일반 사용자 환경에 Vial GUI 프로그램 설치 (실행용)
  environment.systemPackages = with pkgs; [ vial ];

  services.udev.packages = with pkgs; [ qmk-udev-rules vial ];
}
