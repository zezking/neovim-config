local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
        vim.notify("Neotree not found")
        return
end
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
neo_tree.setup({
        close_if_last_window = true,
        enable_diagnostics = false,
        source_selector = {
                winbar         = true,
                content_layout = "center",
                sources        = {
                        {
                                source = "filesystem",
                                display_name = " File"

                        },
                        {
                                source = "buffers",
                                display_name = "➜ Buffs"

                        },
                        {
                                source = "git_status",
                                display_name = " Git"

                        },
                },
        },
        default_component_configs = {
                indent = {
                        padding = 0,
                },
                icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                },
                git_status = {
                        symbols = {
                                added = "",
                                deleted = "",
                                modified = "",
                                renamed = "",
                                untracked = "",
                                ignored = "",
                                unstaged = "",
                                staged = "",
                                conflict = "",
                        },
                },
        },
        window = {
                width = 30,
                mappings = {
                        ["o"] = "open",
                        ["v"] = "open_vsplit",
                },
        },
        filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = "disabled",
                use_libuv_file_watcher = true,
                filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = true,
                },
        },
        event_handlers = {
                {
                        event = "neo_tree_buffer_enter",
                        handler = function(_)
                                vim.opt_local.signcolumn = "auto"
                        end,
                },
        },
})
