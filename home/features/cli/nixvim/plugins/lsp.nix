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
        capabilities = ''
          local capabilities = vim.lsp.protocol.make_client_capabilities()

          -- Explicitly enable code action capabilities
          capabilities.textDocument.codeAction = {
            dynamicRegistration = true,
            codeActionLiteralSupport = {
              codeActionKind = {
                valueSet = {
                  "",
                  "quickfix",
                  "refactor",
                  "refactor.extract",
                  "refactor.inline",
                  "refactor.rewrite",
                  "source",
                  "source.organizeImports",
                }
              }
            },
            dataSupport = true,
            resolveSupport = {
              properties = { "edit" }
            }
          }

          capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        '';
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

          -- Improved quickfix function with better error handling
          local function quickfix()
            local bufnr = vim.api.nvim_get_current_buf()
            
            -- Get the current position
            local params = vim.lsp.util.make_range_params()
            params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
            
            -- Request code actions from LSP server
            vim.lsp.buf_request(bufnr, "textDocument/codeAction", params, function(err, actions, ctx)
              if err then
                vim.notify("Error getting code actions: " .. err.message, vim.log.levels.ERROR)
                return
              end
              
              if not actions or vim.tbl_isempty(actions) then
                vim.notify("No code actions available", vim.log.levels.INFO)
                return
              end
              
              -- Find preferred action
              local preferred_action = nil
              for _, action in ipairs(actions) do
                if action.isPreferred then
                  preferred_action = action
                  break
                end
              end
              
              -- If no preferred action found but there are actions, use the first one
              if not preferred_action and #actions > 0 then
                preferred_action = actions[1]
              end
              
              -- Apply the action if found
              if preferred_action then
                if preferred_action.edit then
                  vim.lsp.util.apply_workspace_edit(preferred_action.edit, "UTF-8")
                end
                if preferred_action.command then
                  local command = preferred_action.command
                  local client = vim.lsp.get_client_by_id(ctx.client_id)
                  if client then
                    if type(command) == "table" then
                      if client.server_capabilities.executeCommandProvider then
                        vim.lsp.buf.execute_command(command)
                      end
                    else
                      vim.cmd(command)
                    end
                  end
                end
                vim.notify("Applied code action", vim.log.levels.INFO)
              else
                vim.notify("No applicable code action found", vim.log.levels.INFO)
              end
            end)
          end

          -- Add quickfix keybinding
          vim.keymap.set("n", "gk", quickfix, 
            { buffer = vim.api.nvim_get_current_buf(), desc = "Apply preferred code action", noremap = true, silent = true })



          -- -- Define the quickfix function and keybinding (not available as a standard function)
          -- local function quickfix()
          --   vim.lsp.buf.code_action({
          --     filter = function(a) return a and a.isPreferred end,
          --     apply = true
          --   })
          -- end

          -- -- Add quickfix keybinding manually
          -- vim.keymap.set("n", "gk", quickfix, 
          --   { buffer = vim.api.nvim_get_current_buf(), desc = "Apply preferred code action", noremap = true, silent = true })
        '';
      };
    };
  };
}
