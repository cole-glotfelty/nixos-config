{ pkgs, ... }:

{
	programs.neovim = {
		enable = true;

		viAlias = true;
		# vimAlias = true; # this could cause problems
		vimdiffAlias = true;

		plugins = with pkgs.vimPlugins; [
			{
				plugin = tokyonight-nvim;
				config = "colorscheme tokyonight-night";
			}
			vim-fugitive
			vim-rhubarb
			gitsigns-nvim
			autoclose-nvim
			undotree
			vim-bbye

			bufferline-nvim
			nvim-web-devicons # dependency of bufferline

			{
				plugin = comment-nvim;
				type = "lua";
				config = "require(\"Comment\").setup()";
			}
			indent-blankline-nvim

			todo-comments-nvim
			plenary-nvim # dependency of todo comments

			lsp-zero-nvim
			# Dependencies for lsp zero
			nvim-lspconfig
			mason-nvim
			mason-lspconfig-nvim
			nvim-cmp
			cmp-nvim-lsp
			cmp-buffer
			cmp-path
			cmp_luasnip
			cmp-nvim-lua
			luasnip
			friendly-snippets

			neodev-nvim
			vim-nix

			(nvim-treesitter.withPlugins (p: [
				p.tree-sitter-nix
				p.tree-sitter-vim
				p.tree-sitter-lua
				p.tree-sitter-cpp
				p.tree-sitter-python
				p.tree-sitter-bash
			]))
			nvim-treesitter-textobjects
		];

		extraLuaConfig = ''
			${builtins.readFile ./lua/options.lua}
			${builtins.readFile ./lua/keymaps.lua}
			${builtins.readFile ./lua/gitsigns.lua}
			${builtins.readFile ./lua/bufferline.lua}
			${builtins.readFile ./lua/autoclose.lua}
			${builtins.readFile ./lua/indent-blankline.lua}
			${builtins.readFile ./lua/cmp.lua}
			${builtins.readFile ./lua/lsp.lua}
			${builtins.readFile ./lua/treesitter.lua}
		'';
	};
}
