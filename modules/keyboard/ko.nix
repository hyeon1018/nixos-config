{ config, lib, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ hangul ];
  };

  environment.systemPackages = with pkgs; [ ibus ];

  myConfig.keyboard = {
    inputSources = [ (lib.gvariant.mkTuple [ "ibus" "hangul" ]) ];
    extraXkbOptions = [ "korean:ralt_hangul" "korean:rctrl_hanja" ];
    extraDconfSettings = {
      "org/freedesktop/ibus/engine/hangul" = { switch-keys = "Hangul"; };
    };
  };
}
