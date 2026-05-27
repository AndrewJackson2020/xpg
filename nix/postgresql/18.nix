import ./generic.nix {
  version = "18.0";
  hash = "sha256-DVuQOx5f42G8p6qVB1GZM3c+s0JmsTV8TneA/e5tYHg=";
  # this test is flaky and is not important for extensions that use hooks
  extraPostPatch = ''
    sed -i \
      -e 's/ timestamptz//' \
      -e 's/geometry horology /geometry /' \
      src/test/regress/parallel_schedule
  '';
}
