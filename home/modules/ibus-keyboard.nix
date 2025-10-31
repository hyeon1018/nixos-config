{ config, osConfig, lib, pkgs, ... }:

let
  keyboardList = osConfig.myConfig.keyboard;
  useKo = builtins.elem "ko" keyboardList;
  useJa = builtins.elem "ja" keyboardList;

in {
  dconf = {
    enable = true;

    settings = {
      "org/gnome/desktop/input-sources" = {
        sources = [ ]
          ++ lib.lists.optional useKo (lib.gvariant.mkTuple [ "ibus" "hangul" ])
          ++ lib.lists.optional useJa
          (lib.gvariant.mkTuple [ "ibus" "mozc-jp" ]);
      };
      "org/freedesktop/ibus/engine/hangul" = { switch-keys = "Hangul"; };
    };
  };
}
