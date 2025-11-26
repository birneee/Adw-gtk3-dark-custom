{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "adw-gtk3-dark-custom";
          version = "0.1.0";
          src = pkgs.lib.cleanSource ./.;
          dontBuild = true;
          strictDeps = true;
          postPatch = ''
            sed -i '/gtk-dark.css/d' gtk-3.0/gtk.css
            sed -i '1i @import url("${pkgs.adw-gtk3}/share/themes/adw-gtk3/gtk-3.0/gtk-dark.css");' gtk-3.0/gtk.css
          '';
          installPhase = ''
            runHook preInstall
            mkdir -p $out/share/themes
            make install PREFIX=$out/share/themes
            runHook postInstall
          '';
        };
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            watchexec
          ];
        };
      }
    );
}
