import ./generic.nix {
  version = "17.0";
  hash = "sha256-fidhMcD91rYliNutmzuyS4w0mNUAkyjbpZrxboGRCd4=";
  extraPatches = [ ./patches/17-add-extension_control_path-for.patch ];
  # this test is flaky and is not important for extensions that use hooks
  extraPostPatch = ''
    sed -i \
      -e 's/ timestamptz//' \
      -e 's/geometry horology /geometry /' \
      src/test/regress/parallel_schedule
  '';
}
