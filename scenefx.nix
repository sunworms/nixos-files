{
  sources,
  lib,
  stdenv,
  meson,
  ninja,
  wlroots_0_19,
  scdoc,
  pkg-config,
  wayland,
  libdrm,
  libxkbcommon,
  pixman,
  wayland-protocols,
  libGL,
  libgbm,
  libxcb,
  libxcb-wm,
  cmake,
  mesa,
  testers,
  wayland-scanner,
}:

stdenv.mkDerivation {
  pname = "scenefx";
  version = "git";

  src = sources.scenefx.src;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    scdoc
    cmake
    wayland-scanner
  ];

  buildInputs = [
    libdrm
    libGL
    libxkbcommon
    libgbm
    libxcb
    libxcb-wm
    pixman
    wayland
    wayland-protocols
    wlroots_0_19
    mesa
  ];

  meta = {
    description = "Drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects";
    homepage = "https://github.com/wlrfx/scenefx";
    license = lib.licenses.mit;
    mainProgram = "scenefx";
    pkgConfigModules = [ "scenefx" ];
    platforms = lib.platforms.all;
  };
}
