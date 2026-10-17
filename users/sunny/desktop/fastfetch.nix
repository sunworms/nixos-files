{
  "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
  logo = {
    type = "small";
    padding = {
      right = 2;
    };
  };
  display = {
    separator = " ";
    key = {
      width = 12;
    };
    color = {
      keys = "blue";
    };
    percent = {
      type = 9;
      color = {
        green = "light_green";
        yellow = "light_yellow";
        red = "light_red";
      };
    };
  };
  modules = [
    {
      type = "title";
      format = "{#bold_blue}{user-name}@{host-name}{#}";
    }
    "separator"
    {
      type = "os";
      key = "OS";
      format = "{name} {version}";
    }
    {
      type = "kernel";
      key = "Kernel";
    }
    {
      type = "uptime";
      key = "Uptime";
    }
    {
      type = "datetime";
      key = "Date";
      format = "{#bold_magenta}{weekday} {month-pretty}/{day-pretty}/{year-short}{#} {#bold_cyan}{hour-pretty}:{minute-pretty}{#}";
    }
    "break"
    {
      type = "wm";
      key = "WM";
    }
    {
      type = "cpu";
      key = "CPU";
      format = "{name}";
    }
    {
      type = "cpuusage";
      key = "CPU usage";
      format = "{avg}";
    }
    "gpu"
    "memory"
    "swap"
    {
      type = "disk";
      key = "Disk";
      folders = "/";
      showExternal = false;
    }
    {
      type = "battery";
      key = "Battery";
      format = "{capacity} [{status}]";
    }
    "wifi"
    {
      type = "sound";
      key = "Volume";
      percent = {
        type = 1;
      };
      format = "{volume-percentage}";
    }
    "break"
    "shell"
    "terminal"
  ];
}
