import ./generic.nix {
  version = "12.19";
  hash = "sha256-YX495Swi6CL09X0B1bIkBQPhmKnsyvWYqFEQm9GOb7s=";
  extraPatches = [ ./patches/12-add-extension_control_path-for.patch ];
}
