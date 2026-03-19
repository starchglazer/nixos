{ self, ... }: {
  dandelion.modules.editors = {
    imports = [
      self.dandelion.modules.editor-vscode
      self.dandelion.modules.editor-zed
    ];
  };
}
