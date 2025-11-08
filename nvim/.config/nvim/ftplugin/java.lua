-- This function is called when a .java filetype is openned.
-- It starts or attaches to an existing JDTLS process
--
-- See https://github.com/Alexis12119/nvim-config/blob/dddd4c867bbd176fccc1ebe1d5703b88acee78a6/core/autocommands.lua#L158-L298 for more config options on setting up debugger

local mason_pkgs_dir = vim.fn.stdpath("data") .. "/mason/packages"
local java_test_path = mason_pkgs_dir .. "/java-test/"
local java_debug_path = mason_pkgs_dir .. "/java-debug-adapter/"
local jdtls_path = mason_pkgs_dir .. "/jdtls/"

-- Load the Java Test and Debug jar files into JDTLS
local bundles = {
	vim.fn.glob(java_debug_path .. "extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "extension/server/*.jar", 1), "\n"))

local config = {
	cmd = { jdtls_path .. "bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	init_options = {
		bundles = bundles,
	},
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			maven = {
				downloadSources = true,
			},
		},
	},
}
require("jdtls").start_or_attach(config)
