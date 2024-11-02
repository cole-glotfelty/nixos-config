{ userSettings, systemSettings, ... }:

{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            options = {
              nixos.expr = ''
                (builtins.getFlake "../../../../flake.nix").nixosConfigurations.${systemSettings.hostname}.options'';
              home-manager.expr = ''
                (builtins.getFlake "../../../../flake.nix").homeConfigurations.${userSettings.username}.options'';
            };
          };
        };
        clangd.enable = true;
        pylsp.enable = true;
        lua-ls.enable = true;
        rust-analyzer.enable = true;
        rust-analyzer.installCargo = true;
        rust-analyzer.installRustc = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
      onAttach = ''
        -- Set custom symbols for diagnostics
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
      '';
    };
  };
}
