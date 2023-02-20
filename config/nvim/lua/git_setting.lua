require"octo".setup({
  mappings = {
    submit_win = {
      approve_review = { lhs = "<Leader>gra", desc = "approve review" },
      comment_review = { lhs = "<Leader>grm", desc = "comment review" },
      request_changes = { lhs = "<Leader>grc", desc = "request changes review" },
    },
  }
})
