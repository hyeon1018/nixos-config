{ config, lib, pkgs, ... }:

let

  hasKr = lib.lists.elem "ko" config.myConfig.keyboard;

in lib.mkIf hasKr {
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ hangul ];
  };

  environment.systemPackages = with pkgs; [ ibus ];
}
