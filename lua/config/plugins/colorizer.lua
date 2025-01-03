return {
  "NvChad/nvim-colorizer.lua",
  dependencies = {
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  opts = {
    filetypes = {
      '*',
      '!cmp_menu',       -- Disable highlighting in cmp menu
    },
    user_default_options = {
      tailwind = true,
      mode = "background",
    }
  }
}
