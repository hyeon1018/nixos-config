{ config, lib, pkgs, ... }:

let

  hasJp = lib.lists.elem "jp" config.myConfig.keyboard;

in lib.mkIf hasJp {
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  environment.systemPackages = with pkgs; [ ibus ];
}
