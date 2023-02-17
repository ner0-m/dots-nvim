return {
     "echasnovski/mini.nvim", 
     branch = "main",
     config = function()
         require("mini.ai").setup()
         require("mini.indentscope").setup {
             char = "┊",
         }

         require("mini.surround").setup {
             mappings = {
                 add = "ca", -- Add surrounding in Normal and Visual modes
                 delete = "cd", -- Delete surrounding
                 find = "cf", -- Find surrounding (to the right)
                 find_left = "cF", -- Find surrounding (to the left)
                 highlight = "ch", -- Highlight surrounding
                 replace = "cr", -- Replace surrounding
                 update_n_lines = "cn", -- Update `n_lines`
             },
         }
     end,
}
