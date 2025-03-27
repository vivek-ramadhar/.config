return {
  "cdelledonne/vim-cmake",
  event = {"BufReadPre", "BufNewFile"},
  filetypes = {"cpp", "c", "h", "hpp", "cmake"},
  config = function()
    vim.g.cmake_generate_options = {"-DCMAKE_EXPORT_COMPILE_COMMANDS=1"}
    vim.g.cmake_build_dir_location = "build"
  end,
}
