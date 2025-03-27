# Vivek's WSL Debian Neovim Setup

A specialized Neovim configuration optimized for C++ development in WSL (Windows Subsystem for Linux), with particular focus on ray tracing projects. This setup bridges the best of both worlds - the power and flexibility of Neovim with the performance needs of advanced C++ projects.

## 🚀 Features

### C++ Development Environment
- **LSP Integration**: Configured clangd for intelligent code completion, diagnostics, and navigation
- **Code Navigation**: Quick jump to definitions (`gd`), declarations (`gD`), and references (`gr`)
- **Project-wide Search**: Fuzzy find files and search text across the entire project
- **Syntax Highlighting**: Treesitter-based syntax highlighting for C++ 
- **Smart Folding**: Code folding with intuitive keybindings (`h` to close, `l` to open)

### Ray Tracing Specific
- **One-key Compilation**: F5 to compile and run with optimizations
- **OpenMP Support**: Built-in support for parallel programming with OpenMP
- **Quick PPM Output**: Streamlined workflow for generating PPM images
- **FFmpeg Integration**: Direct piping to FFmpeg for image and video processing

### Editor Experience
- **Low-latency Editing**: Optimized performance even in WSL environment
- **LaTeX Compatibility**: Maintains all the LaTeX editing capabilities that made me switch from CLion
- **Custom Snippets**: C++-specific snippets for faster coding
- **Terminal Integration**: Built-in terminal with compile-and-run capabilities

Install required dependencies:
bashCopy# Core dependencies
sudo apt update
sudo apt install build-essential cmake ninja-build

# For LSP
sudo apt install clangd

# For OpenMP support
sudo apt install libomp-dev

# For image processing
sudo apt install ffmpeg imagemagick

Launch Neovim to automatically install plugins:
bashCopynvim


## 💡Usage Tips
C++ Development

<F5>: Compile and run current file with optimizations and OpenMP
<F6>: Compile with debug symbols
<F9>: Generate PPM image from raytracer
<F11>: Pipe raytracer output to FFmpeg (MP4)
<F12>: Pipe raytracer output to FFmpeg (PNG)

# Navigation

gd: Go to definition
gr: Find references
<C-p>: Find files in project
<leader>fw: Find word across project

# Editor

h: Close fold (when on foldable region)
l: Open fold (when on closed fold)
<CR>: Toggle fold
<C-t>: Open terminal

## 🔧 Customization
This configuration is specifically optimized for ray tracing projects in C++, but can be easily adapted for other C++ projects or languages. Key configuration files:

lua/neotex/plugins/lsp/clangd.lua: LSP configuration for C++
after/ftplugin/cpp.lua: C++-specific settings and keymaps
lua/neotex/core/options.lua: General Neovim options

## 🌟Why This Setup?
I created this configuration because I was tired of using CLion to work on a raytracer in C++ while enjoying Neovim for editing LaTeX documents. This setup offers the best of both worlds - the lightweight, keyboard-driven efficiency of Neovim combined with the powerful development tools needed for complex C++ projects.
The WSL-specific optimizations ensure that performance remains snappy even when working across the Windows-Linux boundary, which traditionally can cause significant slowdowns.

![image](https://github.com/user-attachments/assets/7b96a598-7ecc-4150-b28b-82ec0fb3fa5b)
