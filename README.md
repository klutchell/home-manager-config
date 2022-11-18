# nixpkgs-config

My Home-Manager configuration with Flakes.

Installation with Flakes: <https://nix-community.github.io/home-manager/index.html#ch-nix-flakes>

1. Clone repository
2. Nix build: `nix build --no-link <flake-uri>#homeConfigurations.kyle.activationPackage`
3. Activate: `"$(nix path-info <flake-uri>#homeConfigurations.kyle.activationPackage)"/activate`
4. Switch: `home-manager switch --flake '<flake-uri>#kyle'`
