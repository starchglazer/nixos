{ self, ... }: {
  dandelion.modules.editors = {
    environment.systemPackages = with pkgs; [
      bruno
      code-cursor
      (vscode-with-extensions.override {
        vscodeExtensions = with vscodeExtensions; [
          adpyke.codesnap
          bradlc.vscode-tailwindcss
          christian-kohler.npm-intellisense
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          expo.vscode-expo-tools
          formulahendry.code-runner
          github.codespaces
          github.copilot
          github.copilot-chat
          github.github-vscode-theme
          github.vscode-pull-request-github
          jnoortheen.nix-ide
          jock.svg
          mhutchie.git-graph
          mkhl.direnv
          ms-vscode.cmake-tools
          ms-vscode.vscode-websearchforcopilot
          pkief.material-icon-theme
          redhat.vscode-yaml
          rvest.vs-code-prettier-eslint
          sndst00m.vscode-native-svg-preview
          theqtcompany.qt
          theqtcompany.qt-core
          theqtcompany.qt-cpp
          theqtcompany.qt-qml
          theqtcompany.qt-ui
          tomoki1207.pdf
          yoavbls.pretty-ts-errors
          yzhang.markdown-all-in-one
        ] ++ vscode-utils.extensionsFromVscodeMarketplace [

        ];
      })
      zed-editor
    ];
  };
}
