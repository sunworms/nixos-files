return function()
    local lzn = require("lz.n")
    lzn.load({
        "lualine-nvim",
        event = "DeferredUIEnter",
        after = function()
            require("lualine").setup({
                options = {
                    theme = "base16",
                },
            })
        end
    })

    local keymap = lzn.keymap({
        "neogit",
        cmd = { "Neogit" },
    })
    keymap.set("n", "<leader>gg", ":Neogit<CR>")

    lzn.load({
        "oil.nvim",
        cmd = { "Oil" },
        after = function()
            require("oil").setup()
        end,
    })

    lzn.load({
        "nvim-autopairs",
        event = "InsertEnter",
        after = function()
            require("nvim-autopairs").setup()
        end,
    })

    lzn.load({
        "nvim-treesitter",
        event = "BufReadPost",
        after = function()
            require('nvim-treesitter').setup()
        end,
    })
end
