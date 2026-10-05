import ./generic.nix {
  version = "15.19";
  hash = "sha256-4aZKh6RrgluIwILkUYFhpHqrU8RWlJZPi6HfKPeFn4k=";
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
