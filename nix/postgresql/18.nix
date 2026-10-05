import ./generic.nix {
  version = "18.6";
  hash = "sha256-VVYQwk1T5DFtpbfT/CXCedloVtXg4j7jCMMoxfqIHZ8=";
  # this test is flaky and is not important for extensions that use hooks
  extraPostPatch = ''
    sed -i \
      -e 's/ timestamptz//' \
      -e 's/geometry horology /geometry /' \
      src/test/regress/parallel_schedule
  '';
}
