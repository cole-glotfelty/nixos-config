{ config, lib, ... }:

with lib;
let
  cfg = config.features.cli.nixvim;
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
          "<leader>a" = "code_action";
          "<leader>rn" = "rename";
          "<leader>f" = "format";
        };

        # Define diagnostic navigation keymaps
        keymaps.diagnostic = {
          "[d" = "goto_prev"; # Go to previous diagnostic
          "]d" = "goto_next"; # Go to next diagnostic
          "gl" = "open_float";
        };

        # TODO: Get this working V

        # extraConfig = ''
        #   -- Define the quickfix function
        #   local function quickfix()
        #       vim.lsp.buf.code_action({
        #           filter = function(a) return a.isPreferred end,
        #           apply = true
        #       })
        #   end
        #
        #   -- Create the keybinding for gk (quickfix)
        #   vim.keymap.set("n", "gk", quickfix, { desc = "Apply preferred code action" })
        # '';
        onAttach = ''
          -- Set custom symbols for diagnostics
          local signs = { Error = "", Warn = "", Hint = "", Info = "" }
          for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
          end

          -- Configure diagnostics display
          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
              focusable = false,
              style = "minimal",
              border = "rounded",
              source = "always",
              header = "",
              prefix = "",
            },
          })
          
          -- -- Add manual keybindings for functions that might not be covered by the standard keymaps
          -- local bufnr = vim.api.nvim_get_current_buf()
          -- 
          -- -- Show diagnostics on the current line
          -- vim.keymap.set("n", "gl", vim.diagnostic.open_float, 
          --   { buffer = bufnr, desc = "Show line diagnostics", noremap = true, silent = true })
          -- 
          -- -- Define the quickfix function
          -- local function quickfix()
          --   vim.lsp.buf.code_action({
          --     filter = function(a) return a and a.isPreferred end,
          --     apply = true
          --   })
          -- end
          -- 
          -- -- Apply quickfix
          -- vim.keymap.set("n", "gk", quickfix, 
          --   { buffer = bufnr, desc = "Apply preferred code action", noremap = true, silent = true })
          -- 
          -- -- Code actions manually defined (since it might be causing issues)
          -- vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, 
          --   { buffer = bufnr, desc = "Code actions", noremap = true, silent = true })
          -- 
          -- -- Rename symbol
          -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, 
          --   { buffer = bufnr, desc = "Rename symbol", noremap = true, silent = true })
          -- 
          -- -- Format document
          -- vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format({async = true}) end, 
          --   { buffer = bufnr, desc = "Format buffer", noremap = true, silent = true })
          -- 
          -- -- Location list with diagnostics
          -- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, 
          --   { buffer = bufnr, desc = "Set location list with diagnostics", noremap = true, silent = true })
        '';
      };
    };
  };
}
