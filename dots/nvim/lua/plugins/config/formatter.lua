-- Formatters
require'formatter'.setup {
  logging = false,
  filetype = {
    java = {
      -- google-java-format
      function()
        return {
          exe = "java",
          args = {"-jar", vim.fn.getenv("HOME").."/.local/share/google-java-format-1.4-all-deps.jar", "-"},
          stdin = true
        }
      end
    }
  }
}
