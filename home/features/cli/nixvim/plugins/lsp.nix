{ config, ... }:

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
            # options = {
            #   nixos.expr = ''
            #   (builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.${config.networking.hostName}.options'';
            #   home-manager.expr = ''
            #   (builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."${config.home.username}".options'';
            # };
            # TODO: figure out someway to variable the hostname
            options = {
            nixos.expr = ''
              (builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.casper.options'';
            home-manager.expr = ''
              (builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."${config.home.username}".options'';
          };
          };
        };
        clangd.enable = true;
        erlangls.enable = true;
        #pylsp.enable = true;
        jedi_language_server.enable = true;
        lua_ls.enable = true;
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
