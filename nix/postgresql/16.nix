import ./generic.nix {
  version = "16.3";
  hash = "sha256-Mxlj1dPcTK9CFqBJ+kC2bWvLjHMGFYWUEblRh2TmBYU=";
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
