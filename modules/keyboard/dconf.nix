{ config, pkgs, lib, ... }:

let
  useKo = lib.lists.elem "ko" config.myConfig.keyboard;
  useJa = lib.lists.elem "ja" config.myConfig.keyboard;

  xkb-options = [ "terminate:ctrl_alt_bksp" "ctrl:nocaps" ]
    ++ lib.lists.optionals useKo [ "korean:ralt_hangul" "korean:rctrl_hanja" ]
    ++ lib.lists.optionals useJa [ ];

  xkb-options-str = lib.concatStringsSep "," xkb-options;
in {
  services.xserver.xkb = { options = xkb-options-str; };

  programs.dconf = {
    profiles = {
      user.databases = [{
        settings = {
          "org/gnome/desktop/input-sources" = {
            sources = [ ] ++ lib.lists.optionals useKo
              [ (lib.gvariant.mkTuple [ "ibus" "hangul" ]) ]
              ++ lib.lists.optionals useJa
              [ (lib.gvariant.mkTuple [ "ibus" "mozc-jp" ]) ];

            xkb-options = xkb-options;
          };

          "org/freedesktop/ibus/engine/hangul" = { switch-keys = "Hangul"; };
        };
      }];
    };
  };
}
