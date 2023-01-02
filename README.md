## Initialize home-manager only

nix build --no-link .#homeConfigurations.macbook.activationPackage
$ "$(nix path-info .#homeConfigurations.macbook.activationPackage)"/activate

Update:
home-manager switch --flake '.#macbook'


