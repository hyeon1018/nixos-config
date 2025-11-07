{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.caffeine
    gnomeExtensions.runcat
    gnomeExtensions.vitals
    gnomeExtensions.tiling-assistant
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "dash-to-dock@micxgx.gmail.com"
          "blur-my-shell@aunetx"
          "appindicatorsupport@rgcjonas.gmail.com"
          "runcat@kolesnikov.se"
          "Vitals@CoreCoding.com"
          "caffeine@patapon.info"
          "clipboard-indicator@tudmotu.com"
          "tiling-assistant@leleat-on-github"
        ];
      };

      # dash-to-dock configuration
      "org/gnome/shell/extensions/dash-to-dock" = {
        # theme
        apply-custom-theme = true;
        custom-theme-shrink = false;
        show-trash = false;
        hide-tooltip = false;

        # action
        middle-click-action = "launch";
        shift-click-action = "launch";
        shift-middle-click-action = "launch";
        scroll-action = "cycle-windows";
      };

      #blur-my-shell configuration
      "org/gnome/shell/extensions/blur-my-shell" = {
        #pipeline-default
        # pipelines = {
        # };
      };

      #blur-my-shell 테마.
      "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
        pipeline = "pipeline_default";
      };
      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = false;
      };
      "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
        pipeline = "pipeline_default";
      };
      "org/gnome/shell/extensions/blur-my-shell/overview" = {
        pipeline = "pipeline_default";

      };
      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        static-blur = true;
        pipeline = "pipeline_default";
        force-light-text = false;
        override-background = true;
        style-panel = 0;
        override-background-dynamically = true;
      };
      "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
        pipeline = "pipeline_default";
      };

      # appindicatorsupport configuration
      # : use default values

      #runcat configuration
      "org/gnome/shell/extensions/runcat" = { idle-threshold = 10; };

      #Vitals configuration
      "org/gnome/shell/extensions/vitals" = {
        hide-zeros = false;
        fixed-widths = false;
        icon-style = 0;
        hide-icons = false;
        position-in-panel = 0;
        menu-centered = false;
        hot-sensors = [
          "_processor_usage_"
          "_memory_usage_"
          "__network-rx_max__"
          "__network-tx_max__"
          "_system_uptime_"
        ];
      };

      # caffeine configuration
      # : use default values

      # clipboard-indicator configuration
      # : use default values

      # tiling-assistant
      "org/gnome/shell/extensions/tiling-assistant" = {
        enable-advanced-experimental-features = true;
        last-version-installed = 53;
        import-layout-examples = false;

        # General
        enable-tiling-popup = false;

        disable-tile-groups = false;
        enable-raise-tile-group = false;

        window-gap = 8;
        single-screen-gap = 8;
        screen-bottom-gap = 8;
        screen-left-gap = 8;
        screen-right-gap = 8;
        screen-top-gap = 8;
        maximize-with-gap = false;

        dynamic-keybinding-behavior = 2;
        focus-hint = 0;
        default-move-mode = 0;

        enable-tile-animations = true;
        enable-untile-animations = true;

        monitor-switch-grace-period = false;
        low-performance-move-mode = false;
        adapt-edge-tiling-to-favorite-layout = false;
        move-adaptive-tiling-mod = 0;
        move-favorite-layout-mod = 2;
        ignore-ta-mod = 0;
        vertical-preview-area = 40;
        horizontal-preview-area = 40;
        toggle-maximize-tophalf-timer = 600;
        enable-hold-maximize-inverse-landscape = false;
        enable-hold-maximize-inverse-portrait = false;

        # Key bindings
        toggle-always-on-top = [ ];
        tile-maximize = [ "<Super>Up" "<Super>KP_5" ];
        center-window = [ ];
        restore-window = [ ];
        auto-tile = [ ];
        toggle-tiling-popup = [ ];

        tile-top-half = [ ];
        tile-bottom-half = [ "<Super>Down" ];
        tile-left-half = [ "<Super>Left" ];
        tile-right-half = [ "<Super>Right" ];
        tile-topleft-quarter = [ ];
        tile-topright-quarter = [ ];
        tile-bottomleft-quarter = [ ];
        tile-bottomright-quarter = [ ];

        overridden-settings = ''
          {
            'org.gnome.mutter.edge-tiling': <true>,
            'org.gnome.desktop.wm.keybindings.maximize': <['<Super>Up']>,
            'org.gnome.mutter.keybindings.toggle-tiled-left': <['<Super>Left']>,
            'org.gnome.mutter.keybindings.toggle-tiled-right': <['<Super>Right']>
          }
        '';

        #Layouts
        show-layout-panel-indicator = true;
        search-popup-layout = [ ];
      };
    };
  };

  # tiling-assistant config file
  xdg.enable = true;

  xdg.configFile = {
    "tiling-assistant/layouts.json".source = ./tiling-assistant-layouts.json;
  };
}

