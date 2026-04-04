return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = function()
      return {
        style = "storm",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
}
