-- ###############
-- ### GENERAL ###
-- ###############
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- ###############
-- ### PLUGINS ###
-- ###############
lvim.plugins = {
  { "romgrk/nvim-treesitter-context" },
}

-- ###################
-- ### KEYMAPPINGS ###
-- ###################
lvim.leader = "space"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"

-- ###########################
-- ### SYNTAX HIGHLIGHTING ###
-- ###########################
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "gitattributes",
  "gitignore",
  "go",
  "java",
  "javascript",
  "json",
  "jsonnet",
  "kotlin",
  "latex",
  "lua",
  "markdown",
  "python",
  "rust",
  "tsx",
  "typescript",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- ###############
-- ### LINTING ###
-- ###############
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "shellcheck" },
}

