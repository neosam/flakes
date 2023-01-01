{
  description = "Install crate2nix";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.crate2nix = {
    url = "github:kolloch/crate2nix";
    flake = false;
  };

  outputs = {self, nixpkgs, flake-utils, crate2nix}:
    flake-utils.lib.eachDefaultSystem
    (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages.default = import crate2nix { inherit pkgs; };
      }
    );
}
