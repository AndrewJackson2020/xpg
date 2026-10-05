import ./generic.nix {
  version = "14.24";
  hash = "sha256-p/p+09VYFyNV9RQGCXp71Pa0c76A8xHvfNqWvzg9iJc=";
  extraPatches = [ ./patches/14-add-extension_control_path-for.patch ];
  muslPatches = {
    disable-test-collate-icu-utf8 = {
      url = "https://git.alpinelinux.org/aports/plain/main/postgresql14/disable-test-collate.icu.utf8.patch?id=56999e6d0265ceff5c5239f85fdd33e146f06cb7";
      hash = "sha256-jXe23AxnFjEl+TZQm4R7rStk2Leo08ctxMNmu1xr5zM=";
    };
  };
}
