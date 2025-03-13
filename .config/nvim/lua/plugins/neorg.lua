return {
    {
        "3rd/image.nvim",
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        lazy = false,
        opts = {}
    },

    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            -- add options here
            -- or leave it empty to use the default settings
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },

    {
        "nvim-neorg/neorg",

        dependencies = { 'benlubas/neorg-interim-ls', '3rd/image.nvim' }, -- , '/3rd/image.nvim' },
        lazy = false,                                                     -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*",                                                    -- Pin Neorg to the latest stable release

        config = function()
            vim.api.nvim_create_autocmd("Filetype", {
                pattern = "norg",
                callback = function()
                    -- WARN: { buffer = true }) prevents command to apply to non-norg buffers
                end
            })

            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {}, -- We added this line!
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                doc = "~/documents/notes/norg/documentation/",
                                ren = "~/documents/notes/norg/software-renderer/",
                            },
                        },
                    },
                    ["core.latex.renderer"] = {
                        -- render_on_enter = true,
                        scale = 1,

                    },
                    ["external.interim-ls"] = {
                        config = {
                            -- default config shown
                            completion_provider = {
                                -- Enable or disable the completion provider
                                enable = true,

                                -- Show file contents as documentation when you complete a file name
                                documentation = true,

                                -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
                                categories = false,

                                -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
                                -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
                                -- people = {
                                --   enable = false,

                                -- path to the file you're like to use with the `{@x` syntax, relative to the
                                -- workspace root, without the `.norg` at the end.
                                -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
                                -- Note that this will change with your workspace, so it fails silently if the file
                                -- doesn't exist
                                -- path = "people",
                                -- }
                            }
                        }
                    },
                    ["core.completion"] = {
                        config = { engine = { module_name = "external.lsp-completion" } },
                    },

                }
            })
        end,
    },

}
