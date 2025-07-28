 {
     description = "Flake Update";
   
     inputs = {
       nixpkgs.url = "nixpkgs/nixos-25.05";
       };
   
     outputs = {self, nixpkgs, ... }:
        let
          lib = nixpkgs.lib;
        in {
        nixosConfigurations = {
          proxy-pc = lib.nixosSystem {
            system = "x86_64-linux";
             modules = [ ./configuration.nix ];
            };
        };
      };
}
