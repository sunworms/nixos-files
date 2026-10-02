{
  layer = "top";
  position = "bottom";
  margin = 0;
  spacing = 1;
  reload_style_on_change = true;
  modules-left = [
    "niri/workspaces"
    "group/custom-group"
    "niri/window"
  ];
  modules-center = [
  ];
  modules-right = [
    "bluetooth"
    "network"
    "cpu"
    "memory"
    "temperature"
    "backlight"
    "wireplumber#sink"
    "wireplumber#source"
    "battery"
    "clock"
  ];
  "group/custom-group" = {
    orientation = "horizontal";
    modules = [
      "tray"
      "idle_inhibitor"
    ];
  };
  "niri/workspaces" = {
    format = "{value}";
    current-only = true;
  };
  "niri/window" = {
    format = "{title}";
    max-length = 50;
  };
  tray = {
    icon-size = 16;
    spacing = 10;
    show-passive-items = true;
    reverse-direction = true;
  };
  clock = {
    interval = 60;
    format = "  {:%I:%M %p}";
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    calendar = {
      mode = "year";
      mode-mon-col = 3;
      weeks-pos = "right";
      first-day-of-week = 1;
      on-scroll = 1;
      on-click-right = "mode";
      format = {
        months = "<span color='#5E81AC'><b>{}</b></span>";
        days = "<span color='#2E3440'><b>{}</b></span>";
        weeks = "<span color='#4C566A'><b>W{}</b></span>";
        weekdays = "<span color='#D08770'><b>{}</b></span>";
        today = "<span color='#BF616A'><b><u>{}</u></b></span>";
      };
    };
    actions = {
      on-click-right = "mode";
      on-click-forward = "tz_up";
      on-click-backward = "tz_down";
      on-scroll-up = "shift_up";
      on-scroll-down = "shift_down";
    };
    format-alt = " {:%a %b %d}";
  };
  temperature = {
    hwmon-path-abs = "/sys/devices/platform/coretemp.0/hwmon";
    input-filename = "temp1_input";
    critical-threshold = 80;
    interval = 2;
    format = " {temperatureC:>2}°C";
    format-icons = [
      ""
      ""
      ""
    ];
  };
  cpu = {
    interval = 2;
    format = "  {usage:>2}%";
    on-click-right = "foot btop";
  };
  memory = {
    interval = 2;
    format = "  {used:0.1f}G/{total:0.1f}G";
    on-click-right = "foot btop";
  };
  disk = {
    interval = 15;
    format = "󰋊 {percentage_used:>2}%";
  };
  backlight = {
    format = "{icon} {percent:>2}%";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
    ];
  };
  network = {
    interval = 1;
    format-wifi = " {bandwidthTotalBytes:>2}";
    format-ethernet = " {bandwidthTotalBytes:>2}";
    tooltip-format-ethernet = "󰈀 {ipaddr}";
    tooltip-format-wifi = "  {essid} ({signalStrength}%)";
    tooltip-format = "󰤯 {ifname} via {gwaddr}";
    format-linked = "󰀦 {ifname} (No IP)";
    format-disconnected = "󰀦 Disconnected";
    format-alt = "{ifname}: {gwaddr}/{cidr}";
  };
  "wireplumber#sink" = {
    format = "{icon} {volume:>3}%";
    format-muted = "󰖁 {volume:>3}%";
    format-icons = [
      ""
      ""
      ""
    ];
    max-volume = 150;
    on-click-right = "pwvucontrol";
  };
  "wireplumber#source" = {
    node-type = "Audio/Source";
    format = "";
    format-muted = "";
    on-click-right = "pwvucontrol";
  };
  bluetooth = {
    format = " {status}";
    format-connected = " {device_alias}";
    format-connected-battery = " {device_alias} {device_battery_percentage}%";
    tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
    tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    on-click-right = "blueman-manager";
  };
  battery = {
    format = "{icon} {capacity}%";
    format-alt = "{icon} {time}";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
    ];
    interval = 2;
  };
  idle_inhibitor = {
    format = "{icon}";
    format-icons = {
      activated = "󰈈";
      deactivated = "󰈉";
    };
  };
}
