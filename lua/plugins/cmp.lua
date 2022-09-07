---@type PluginSpec
local Spec = { "hrsh7th/nvim-cmp" }

Spec.requires = {
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind.nvim",
  { "dcampos/cmp-snippy", requires = "dcampos/nvim-snippy" },
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local cmp = require "cmp"
  local lspkind = require "lspkind"
  local snippy = require "snippy"

  cmp.setup {
    preselect = cmp.PreselectMode.None,
    formatting = {
      format = lspkind.cmp_format {
        mode = "symbol_text",
        menu = {
          buffer = "[BUF]",
          path = "[PTH]",
          cmdline = "[CMD]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[LUA]",
          snippy = "[SNP]",
        },
      },
    },
    snippet = {
      expand = function(args)
        snippy.expand_snippet(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered { border = "single" },
      documentation = cmp.config.window.bordered { border = "double" },
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-U>"] = cmp.mapping.scroll_docs(-4),
      ["<C-D>"] = cmp.mapping.scroll_docs(4),
      ["<C-E>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippy.can_expand_or_advance() then
          snippy.expand_or_advance()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippy.can_jump(-1) then
          snippy.previous()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources(
      { { name = "nvim_lsp" }, { name = "snippy" }, { name = "nvim_lua" } },
      { { name = "buffer" } }
    ),
  }

  -- use <?> for which-key plugin
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path", option = { trailing_slash = true } },
    }, {
      { name = "cmdline" },
    }),
  })

  local ok, ext = pcall(require, "nvim-autopairs.completion.cmp")
  if ok then
    cmp.event:on("confirm_done", ext.on_confirm_done { map_char = { tex = "" } })
  end

  vim.opt.completeopt = { "menu", "menuone", "noselect" }
end

return Spec
