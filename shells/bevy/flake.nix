{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem
    (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          buildInputs = with pkgs; [
            cargo rustc rust-analyzer
            udev alsa-lib vulkan-loader
            xlibsWrapper xorg.libXcursor xorg.libXrandr xorg.libXi # To use x11 feature
            libxkbcommon wayland # To use wayland feature
          ];
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            pkg-config
            llvmPackages.bintools # To use lld linker
            python3
          ];
          inherit buildInputs;
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        };
      }
    );
}
