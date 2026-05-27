import ./generic.nix {
  version = "13.15";
  hash = "sha256-Qu3UFURtM7jCQr520a0FdTGyJksuhpOTObcHXG5OySU=";
  extraPatches = [ ./patches/13-add-extension_control_path-for.patch ];
}
