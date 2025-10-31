{ lib, ... }:

{
  options.myConfig.keyboard = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "ibus keyboard list. ko/jp";
  };
}
