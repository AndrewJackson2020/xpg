let
  lock = (builtins.fromJSON (builtins.readFile ../flake.lock)).nodes.nixpkgs.locked;
  pkgs = import (builtins.fetchTarball {
    name = lock.rev;
    url = "https://github.com/${lock.owner}/${lock.repo}/archive/${lock.rev}.tar.gz";
    sha256 = lock.narHash;
  }) { };
in
with pkgs;
let
  xpgPkgs = import ../default.nix;
  pgsqlcheck17 = callPackage ../nix/plpgsql-check.nix {
    postgresql = xpgPkgs.postgresql_17;
  };
in
{
  xpg = xpgPkgs.xpg.withExtensions {
    extensions = {
      "17" = [ pgsqlcheck17 ];
    };
  };
}
