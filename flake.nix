{
  description = "nixos go brrrr";

  # yoinked @Rexcrazy804's cute nixos dandelion setup
  # https://github.com/Rexcrazy804/Zaphkiel
  outputs = { ... } @ inputs:
  let
    dandelion = import ./dandelion.nix inputs;
    inherit (dandelion) importModules recursiveImport;
  in importModules [
    (recursiveImport ./modules)
    (recursiveImport ./flake)
  ];

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/x86_64-linux";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.smfh.follows = "";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "";
    };
    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
