{
  description = "Pick a GitHub repository with fzf and clone it with ghq";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      flake = {
        overlays.default = final: _prev: {
          gh-fzf-get = final.stdenvNoCC.mkDerivation {
            pname = "gh-fzf-get";
            version = "0.1.0";

            src = self;

            nativeBuildInputs = [
              final.makeWrapper
            ];

            dontBuild = true;

            installPhase = ''
              runHook preInstall

              install -Dm755 gh-fzf-get "$out/bin/gh-fzf-get"

              runHook postInstall
            '';

            postFixup = ''
              patchShebangs "$out/bin/gh-fzf-get"
              wrapProgram "$out/bin/gh-fzf-get" \
                --prefix PATH : ${
                  final.lib.makeBinPath [
                    final.coreutils
                    final.fzf
                    final.gawk
                    final.gh
                    final.ghq
                  ]
                }
            '';

            meta = {
              description = "Pick a GitHub repository with fzf and clone it with ghq";
              homepage = "https://github.com/ph0ryn/gh-fzf-get";
              license = final.lib.licenses.mit;
              mainProgram = "gh-fzf-get";
              platforms = final.lib.platforms.unix;
            };
          };
        };
      };
    };
}
