{ config, lib, ... }:

with lib;
let cfg = config.features.cli.nixvim;
  hostname = config.custom.hostname;
in {
  config = mkIf cfg.enable {
    programs.nixvim.plugins = {
      lsp = {
        enable = true;
        # TODO: Research this some more
        # TODO: Look into lsp-zero and primeagen stuff on how this works in normal neovim
        # capabilities = ''
        #   local capabilities = vim.lsp.protocol.make_client_capabilities()
        #   capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        # '';
        servers = {
          # Nix
          nixd = {
            enable = true;
            settings = {
              nixpkgs = {
                expr = ''
                  import (builtins.getFlake "git+file:///home/${config.home.username}/Projects/nixcfg").inputs.nixpkgs { }'';
              };
              # TODO: figure out someway to variable the hostname
              formatting.command = [ "nixfmt" ];
              options = {
                nixos.expr = ''
                  (builtins.getFlake "git+file:///home/${config.home.username}/Projects/nixcfg").nixosConfigurations.${hostname}.options'';
                home-manager.expr = ''
                  (builtins.getFlake "git+file:///home/${config.home.username}/Projects/nixcfg").homeConfigurations."${config.home.username}@${hostname}".options'';
              };
            };
          };
          # C/C++
          clangd.enable = true;
          #Erlang
          erlangls.enable = true;
          # Python
          #pylsp.enable = true;
          jedi_language_server.enable = true;
          # Lua
          lua_ls.enable = true;
          # Rust
          rust_analyzer.enable = true;
          rust_analyzer.installCargo = true;
          rust_analyzer.installRustc = true;
        };
        # TODO: fix code action, gl to get line errors
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
  };
}
