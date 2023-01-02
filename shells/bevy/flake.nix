{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem
    (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          rustInputs = with pkgs; [cargo rustc rust-analyzer];
          linuxInputs = with pkgs; [
            udev alsa-lib vulkan-loader
            xlibsWrapper xorg.libXcursor xorg.libXrandr xorg.libXi # To use x11 feature
            libxkbcommon wayland # To use wayland feature
          ];
          # From here: https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/apple-sdk/frameworks.nix
          darwinInputs = with pkgs.darwin.apple_sdk.frameworks; [
            ApplicationServices CoreGraphics CoreVideo CoreFoundation
            AppKit QuartzCore Foundation CoreGraphics Metal CoreServices
          ];
          nativeInputs = with pkgs; if pkgs.stdenv.isDarwin then darwinInputs else linuxInputs;
          buildInputs = rustInputs ++ nativeInputs;
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            pkg-config
            #llvmPackages.bintools # To use lld linker
            python3
          ];
          inherit buildInputs;
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        };
      }
    );
}
