import ./generic.nix {
  version = "17.11";
  hash = "sha256-3Sfys8Wec+0UqjMkkBJCv2mgMqY0eAXydOYmAyLUKXk=";
  extraPatches = [ ./patches/17-add-extension_control_path-for.patch ];
  # this test is flaky and is not important for extensions that use hooks
  extraPostPatch = ''
    sed -i \
      -e 's/ timestamptz//' \
      -e 's/geometry horology /geometry /' \
      src/test/regress/parallel_schedule
  '';
}
