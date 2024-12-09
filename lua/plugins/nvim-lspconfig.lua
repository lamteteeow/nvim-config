return {
    {
        "neovim/nvim-lspconfig",
        -- Switch to config in mason-lspconfig.lua to handle servers instead
        config = function()
            local lspconfig = require("lspconfig")
            --     lspconfig.ruff_lsp.setup({})
            --     lspconfig.rust_analyzer.setup({})
            --     lspconfig.luals.setup({})
            --     lspconfig.zls.setup({})
            lspconfig.biome.setup({})
            -- lspconfig.glsl_analyzer.setup({})
            -- for Python type checking but however there is bug still
            -- therefore using pyright instead
            -- lspconfig.pylyzer.setup({})
            lspconfig.pyright.setup({
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                        },
                    },
                },
            })
            -- for Python linting, formatting, organizing imports
            lspconfig.ruff.setup({
                trace = "messages",
                init_options = {
                    settings = {
                        -- Ruff language server settings go here
                        logLevel = "debug",
                    },
                },
            })
        end,
        opts = {
            servers = {
                -- jsonls = {
                --     mason = false,
                -- },
                -- pyright = {
                --     settings = {
                --         pyright = {
                --             disableOrganizeImports = true, -- Using Ruff
                --         },
                --         python = {
                --             analysis = {
                --                 ignore = { "*" }, -- Using Ruff
                --                 -- typeCheckingMode = "off", -- Using mypy
                --                 -- when off
                --             },
                --         },
                --     },
                --     -- capabilities = {
                --     --     textDocument = {
                --     --         publishDiagnostics = {
                --     --             tagSupport = {
                --     --                 valueSet = { 2 },
                --     --             },
                --     --         },
                --     --     },
                --     -- },
                --     capabilities = (function()
                --         local capabilities = vim.lsp.protocol.make_client_capabilities()
                --         capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
                --         return capabilities
                --     end)(),
                -- },
                -- ruff_lsp = {
                --     on_attach = function(client, _)
                --         client.server_capabilities.hoverProvider = false
                --     end,
                -- },
            },
        },
    },
}
