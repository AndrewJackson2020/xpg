import ./generic.nix {
  version = "15.7";
  hash = "sha256-pG/klIWrY4Xjnau7tlT10wSSBvds1pXiJCaHKVIJmPc=";
  extraPatches = [
    ./patches/15-add-extension_control_path-for.patch
  ];
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
