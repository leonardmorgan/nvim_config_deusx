return {
  'lukas-reineke/indent-blankline.nvim',

  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },

  opts = {
    use_treesitter = true,
    use_treesitter_scope = true,
    show_first_indent_level = false,
    show_current_context = true,
    char_blankline = '',
  },
}
