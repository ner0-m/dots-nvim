return {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local mark = require "harpoon.mark"
        local ui = require "harpoon.ui"

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd file to harpoon" })
        vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Toggle harpoon ui" })

        vim.keymap.set("n", "<C-j>", function()
            ui.nav_file(1)
        end, { desc = "Go to first file" })
        vim.keymap.set("n", "<C-k>", function()
            ui.nav_file(2)
        end, { desc = "Go to second file" })
        vim.keymap.set("n", "<C-l>", function()
            ui.nav_file(3)
        end, { desc = "Go to third file" })
    end,
}
