{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ feishin remmina flacon gimp3 qdiskinfo ];

  programs.zsh = { enable = true; };

  programs.git = {
    enable = true;
    userName = "dohyeon kim";
    userEmail = "hyeon1018@live.com";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/input-sources" = {
        sources = [ (lib.gvariant.mkTuple [ "ibus" "hangul" ]) ];
        xkb-options = [ "korean:ralt_hangul" "korean:rctrl_hanja" ];
      };
    };
  };
}

