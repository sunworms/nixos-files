{
  sources,
  lib,
  cairo,
  dbus,
  libGL,
  libdisplay-info,
  libinput,
  seatd,
  libxkbcommon,
  libgbm,
  pango,
  pipewire,
  pkg-config,
  rustPlatform,
  systemd,
  wayland,
  installShellFiles,
  withDbus ? true,
  withSystemd ? true,
  withScreencastSupport ? true,
  withDinit ? false,
}:

rustPlatform.buildRustPackage {
  pname = "niri";
  version = "25.11";

  src = sources.niri-blur.src;

  postPatch = ''
    patchShebangs resources/niri-session
    substituteInPlace resources/niri.service \
      --replace-fail 'ExecStart=niri' "ExecStart=$out/bin/niri"
  '';

  cargoLock = {
    allowBuiltinFetchGit = true;
    lockFile = "${sources.niri-blur.src}/Cargo.lock";
  };

  strictDeps = true;

  nativeBuildInputs = [
    rustPlatform.bindgenHook
    pkg-config
    installShellFiles
  ];

  buildInputs = [
    cairo
    dbus
    libGL
    libdisplay-info
    libinput
    seatd
    libxkbcommon
    libgbm
    pango
    wayland
  ]
  ++ lib.optional (withDbus || withScreencastSupport || withSystemd) dbus
  ++ lib.optional withScreencastSupport pipewire
  # Also includes libudev
  ++ lib.optional withSystemd systemd;

  buildFeatures =
    lib.optional withDbus "dbus"
    ++ lib.optional withDinit "dinit"
    ++ lib.optional withScreencastSupport "xdp-gnome-screencast"
    ++ lib.optional withSystemd "systemd";
  buildNoDefaultFeatures = true;

  doCheck = false;

  postInstall = ''
    installShellCompletion --cmd niri \
      --bash <($out/bin/niri completions bash) \
      --fish <($out/bin/niri completions fish) \
      --nushell <($out/bin/niri completions nushell) \
      --zsh <($out/bin/niri completions zsh)

    install -Dm644 resources/niri.desktop -t $out/share/wayland-sessions
    install -Dm644 resources/niri-portals.conf -t $out/share/xdg-desktop-portal
  ''
  + lib.optionalString withSystemd ''
    install -Dm755 resources/niri-session $out/bin/niri-session
    install -Dm644 resources/niri{.service,-shutdown.target} -t $out/share/systemd/user
  '';

  env = {
    # Force linking with libEGL and libwayland-client
    # so they can be discovered by `dlopen()`
    RUSTFLAGS = toString (
      map (arg: "-C link-arg=" + arg) [
        "-Wl,--push-state,--no-as-needed"
        "-lEGL"
        "-lwayland-client"
        "-Wl,--pop-state"
      ]
    );
  };

  passthru = {
    providedSessions = [ "niri" ];
  };

  meta = {
    description = "Scrollable-tiling Wayland compositor";
    homepage = "https://github.com/niri-wm/niri";
    license = lib.licenses.gpl3Only;
    mainProgram = "niri";
    platforms = lib.platforms.linux;
  };
}
