return {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", ".git", "shell.nix" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			-- options = {
			-- 	nixos = {
			-- 		expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nixos.options',
			-- 	},
			-- 	home_manager = {
			-- 		expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
			-- 	},
			-- },
		},
	},
}
