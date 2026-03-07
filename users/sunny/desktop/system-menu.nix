{
  python3Packages,
}:

python3Packages.buildPythonApplication {
  pname = "system-menu";
  version = "1.0";

  src = ./.;

  propagatedBuildInputs = with python3Packages; [
    psutil
  ];

  format = "other";

  installPhase = ''
    mkdir -p $out/bin
    cp system-menu.py $out/bin/system-menu
    chmod +x $out/bin/system-menu
  '';
}
