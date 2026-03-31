return {
    {
        "lualine-nvim",
        event = "UIEnter",
        after = function()
            vim.defer_fn(function()
                require("lualine").setup({
                    options = {
                        theme = "base16",
                    },
                })
            end, 0)
        end
    },
    {
        "neogit",
        cmd = { "Neogit" },
    },
    {
        "oil.nvim",
        cmd = { "Oil" },
        after = function()
            require("oil").setup()
        end,
    },
    {
        "nvim-autopairs",
        event = "InsertEnter",
        after = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "nvim-treesitter",
        event = "BufReadPost",
        after = function()
            require('nvim-treesitter').setup()
        end,
    }
}
