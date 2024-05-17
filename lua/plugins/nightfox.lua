return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        colorblind = {
          enable = true,
          severity = {
            -- protan = 1,
            -- deutan = 1,
            -- tritan = 1,
          },
        },
      },
    })
  end,
}
