return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        -- LSP servers and clients communicate which features they support through "capabilities".
        --  By default, Neovim supports a subset of the LSP specification.
        --  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
        --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
        --
        -- This can vary by config, but in general for nvim-lspconfig:

        -- Switch to config in mason-lspconfig.lua to handle servers instead
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")
            -- lspconfig.ruff_lsp.setup({})
            -- lspconfig.rust_analyzer.setup({})
            -- lspconfig.zls.setup({})
            lspconfig.biome.setup({ capabilities = capabilities })
            -- lspconfig.glsl_analyzer.setup({})
            -- for Python type checking
            -- lspconfig.pyright.setup({
            --     capabilities = capabilities,
            --     settings = {
            --         pyright = {
            --             -- Using Ruff's import organizer
            --             disableOrganizeImports = true,
            --         },
            --         python = {
            --             analysis = {
            --                 -- Ignore all files for analysis to exclusively use Ruff for linting
            --                 ignore = { "*" },
            --             },
            --         },
            --     },
            -- })
            lspconfig.basedpyright.setup({
                capabilities = capabilities,
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
                capabilities = capabilities,
                trace = "messages",
                init_options = {
                    settings = {
                        -- Ruff language server settings go here
                        logLevel = "debug",
                    },
                },
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
        end,
        -- -- Another way to define settings
        -- opts = {
        --     servers = {
        --         jsonls = {
        --             mason = false,
        --         },
        --         pyright = {
        --             settings = {
        --                 pyright = {
        --                     disableOrganizeImports = true, -- Using Ruff
        --                 },
        --                 python = {
        --                     analysis = {
        --                         ignore = { "*" }, -- Using Ruff
        --                         -- typeCheckingMode = "off", -- Using mypy
        --                         -- when off
        --                     },
        --                 },
        --             },
        --             -- capabilities = {
        --             --     textDocument = {
        --             --         publishDiagnostics = {
        --             --             tagSupport = {
        --             --                 valueSet = { 2 },
        --             --             },
        --             --         },
        --             --     },
        --             -- },
        --             capabilities = (function()
        --                 local capabilities = vim.lsp.protocol.make_client_capabilities()
        --                 capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        --                 return capabilities
        --             end)(),
        --         },
        --         ruff_lsp = {
        --             on_attach = function(client, _)
        --                 client.server_capabilities.hoverProvider = false
        --             end,
        --         },
        --     },
        --     config = function()
        --         local capabilities = require("blink.cmp").get_lsp_capabilities()
        --         local lspconfig = require("lspconfig")
        --
        --         lspconfig["lua-ls"].setup({ capabilities = capabilities })
        --     end,
        -- },
    },
}
