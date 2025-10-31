{ config, lib, pkgs, ... }:

let

  hasJa = lib.lists.elem "ja" config.myConfig.keyboard;

in lib.mkIf hasJa {
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  environment.systemPackages = with pkgs; [ ibus ];
}
