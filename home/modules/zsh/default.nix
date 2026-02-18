{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion = { enable = true; };

    syntaxHighlighting = { enable = true; };

    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" ];
    };

    plugins = [{
      name = "custom-theme";
      src = ./theme;
      file = "custom-theme.zsh-theme";
    }];
  };
}

