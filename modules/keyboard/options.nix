{ lib, ... }:

{
  options.myConfig.keyboard = {
    inputSources = lib.mkOption {
      type = lib.types.listOf lib.types.anything;
      default = [ ];
      description = "List of GNOME input sources (ibus tuples)";
    };

    extraXkbOptions = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional xkb options from keyboard modules";
    };

    extraDconfSettings = lib.mkOption {
      type = lib.types.attrsOf (lib.types.attrsOf lib.types.anything);
      default = { };
      description = "Additional dconf settings from keyboard modules";
    };
  };
}
