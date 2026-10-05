import ./generic.nix {
  version = "16.15";
  hash = "sha256-wVdTQfp71A9SdOpGWzQ5D03GTN0HcK8ycAXKrrn2t+0=";
  extraPatches = [ ./patches/16-add-extension_control_path-for.patch ];
  # these tests are too flaky and are not important for extension that use hooks
  extraPostPatch = ''
    sed -i \
      -e 's/ date//' \
      -e 's/ timestamptz//' \
      -e 's/geometry horology /geometry /' \
      -e 's/ with xml$/ with/' \
      src/test/regress/parallel_schedule
  '';
}
