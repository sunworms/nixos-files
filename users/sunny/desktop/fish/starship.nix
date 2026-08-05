{
  "$schema" = "https://starship.rs/config-schema.json";
  right_format = "$time";
  time = {
    disabled = false;
    format = "[$time]($style)";
  };
  character = {
    success_symbol = "[→](cyan)";
    error_symbol = "[→](red)";
    vimcmd_symbol = "[←](green)";
    vimcmd_replace_symbol = "[↑](bold purple)";
    vimcmd_replace_one_symbol = "[↑](bold purple)";
    vimcmd_visual_symbol = "[↑](bold yellow)";
  };
  azure = {
    symbol = "☁️ ";
  };
  battery = {
    full_symbol = "• ";
    charging_symbol = "⇡ ";
    discharging_symbol = "⇣ ";
    unknown_symbol = "❓ ";
    empty_symbol = "❗ ";
  };
  erlang = {
    symbol = "ⓔ ";
  };
  nodejs = {
    symbol = "[⬢](bold green) ";
  };
  pulumi = {
    symbol = "🧊 ";
  };
}
