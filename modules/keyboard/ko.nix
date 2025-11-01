{ config, lib, pkgs, ... }:

let

  hasKo = lib.lists.elem "ko" config.myConfig.keyboard;

in lib.mkIf hasKo {

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ hangul ];
  };

  environment.systemPackages = with pkgs; [ ibus ];
}
