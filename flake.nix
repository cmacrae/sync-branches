{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flakelight.url = "github:nix-community/flakelight";
  };

  outputs = { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      devShell = pkgs:
        {
          packages = with pkgs; [
            nodejs_20
            yarn
          ];
        };
    };
}
