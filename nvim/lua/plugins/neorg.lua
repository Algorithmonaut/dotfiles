return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        dependencies = { "benlubas/neorg-conceal-wrap" },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["external.conceal-wrap"] = {},
                },
            })
        end,
    },
}
