{ nixpkgs ? throw "[Dandelion]: passed attribute set must contain nixpkgs!!!", ... } @ inputs:
let
  inherit (nixpkgs.lib) flip flatten hasSuffix filter filesystem pipe recursiveUpdate foldAttrs;

  recursiveImport = path: filter (hasSuffix ".nix") (filesystem.listFilesRecursive path);
  importModules = flip pipe [
    flatten
    (map (x:
      if builtins.isPath x
      then import x
      else x))
    (map (x:
      if builtins.isFunction x
      then x inputs
      else x))
    (foldAttrs recursiveUpdate {})
  ];
in {
  inherit recursiveImport importModules;
}
