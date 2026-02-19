{ config, lib, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];
  };

  environment.systemPackages = with pkgs; [ ibus ];

  myConfig.keyboard = {
    inputSources = [ (lib.gvariant.mkTuple [ "ibus" "mozc-jp" ]) ];
  };
}
