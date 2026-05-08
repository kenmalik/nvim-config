return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>pf", require("telescope.builtin").find_files,           desc = "Find files" },
        { "<leader>pg", require("telescope.builtin").git_files,            desc = "Find git files" },
        { "<leader>ps", require("telescope.builtin").live_grep,            desc = "Live grep" },
        { "<leader>gO", require("telescope.builtin").lsp_document_symbols, desc = "Find LSP symbols" },
        { "<leader>fh", require("telescope.builtin").help_tags,            desc = "Find help tags" },
        { "<leader>fw", require("telescope.builtin").grep_string,          desc = "Grep string under cursor" },
    },
}
