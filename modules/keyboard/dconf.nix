{ config, pkgs, lib, ... }:

let
  cfg = config.myConfig.keyboard;

  xkb-options = [ "terminate:ctrl_alt_bksp" "ctrl:nocaps" ]
    ++ cfg.extraXkbOptions;

  xkb-options-str = lib.concatStringsSep "," xkb-options;
in {
  services.xserver.xkb = { options = xkb-options-str; };

  programs.dconf = {
    profiles = {
      user.databases = [{
        settings = {
          "org/gnome/desktop/input-sources" = {
            sources = cfg.inputSources;
            xkb-options = xkb-options;
          };
        } // cfg.extraDconfSettings;
      }];
    };
  };
}
