{
  description = "A template for Nix based C project setup.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: inputs.utils.lib.eachSystem [
    "x86_64-linux" "i686-linux" "aarch64-linux" "x86_64-darwin"
  ] (system: let pkgs = import nixpkgs {
        inherit system;
      };
      examples = pkgs.stdenv.mkDerivation {
        pname = "tutorial01";
        version = "0.1.0";
        src = ./.;
        nativeBuildInputs = [
          pkgs.freeglut
          pkgs.gcc
          pkgs.gdb
          pkgs.glew
          pkgs.glfw
          pkgs.gnumake
          pkgs.libGLU
          pkgs.libGL
        ];
        buildPhase = "make examples";
        installPhase = ''
          out=$out make $out/bin
        '';
      };
  in rec {
    defaultApp = inputs.utils.lib.mkApp { drv = defaultPackage; };
    defaultPackage = examples;
    devShell = pkgs.mkShell {
      buildInputs = [ examples ];
    };
  });
}
