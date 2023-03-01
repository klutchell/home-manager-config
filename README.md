# nixpkgs-config

My Home-Manager configuration with Flakes.

## Getting Started

Installation with Flakes: <https://nix-community.github.io/home-manager/index.html#ch-nix-flakes>

```bash
# 1. Clone repository
# 2. Nix build
nix build --no-link .#homeConfigurations.kyle.activationPackage
# 3. Activate
"$(nix path-info .#homeConfigurations.kyle.activationPackage)"/activate
# 4. Switch
home-manager switch --flake '.#kyle'
```
