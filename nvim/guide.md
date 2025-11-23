# Neovim Configuration Guide

Complete guide for your custom Neovim setup optimized for C development.

## 📦 Installation

1. **Clone or copy this config to your Neovim directory:**
   ```bash
   # If using standard location
   cp -r /goinfre/abdessel/nvim-config ~/.config/nvim
   
   # Or create a symlink
   ln -s /goinfre/abdessel/nvim-config ~/.config/nvim
   ```

2. **Launch Neovim:**
   ```bash
   nvim
   ```
   Lazy.nvim will automatically install all plugins on first launch.

3. **Install LSP servers:**
   - Open Neovim and run `:Mason`
   - clangd and clang-format will be auto-installed

---

## 🎨 UI & APPEARANCE

### Theme Switcher (Themery)
- **Keybind:** `<leader>tt` (Space + tt)
- **Description:** Switch between themes with live preview
- **Current theme:** Oscura (persists across sessions)
- **Theme file:** `lua/theme.lua`

### Status Line (Lualine)
- Shows file info, git status, diagnostics, and mode
- Located at the bottom of the screen

### Breadcrumbs (Barbecue)
- Shows file path and current code symbols (functions, classes)
- Displays at the top of the buffer
- Automatically updates as you navigate code

### Noice.nvim
- Enhanced UI for messages, cmdline, and popups
- Rounded borders for a cleaner look

---

## 📁 FILE NAVIGATION

### File Explorer (nvim-tree)
- **Toggle:** `Ctrl+n` - Open/close the file tree
- **Focus:** `<leader>e` (Space + e) - Switch between tree and file
- **Width:** 30 columns on the left side
- **Features:**
  - Shows dotfiles
  - Groups empty directories
  - File icons with nvim-web-devicons

**Inside nvim-tree:**
- `Enter` - Open file/folder
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `x` - Cut file
- `c` - Copy file
- `p` - Paste file
- `R` - Refresh tree

---

## 💻 LSP & COMPLETION

### Language Server (clangd)
- **Auto-installed via Mason**
- **Features:**
  - Background indexing
  - Clang-tidy integration
  - Header insertion (include-what-you-use)
  - Detailed completion
  - Function argument placeholders

**LSP Keybinds (automatic when LSP is active):**
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Autocompletion (blink.cmp)
- **Trigger:** Automatic as you type
- **Accept:** `Enter` - Accept selected completion
- **Navigate:** `Ctrl+n` / `Ctrl+p` - Next/previous suggestion
- **Sources:** LSP, snippets, buffer, path

### Code Snippets
- Powered by friendly-snippets
- Integrated with blink.cmp

### Clangd Extensions
- Enhanced features for C/C++ development
- Inlay hints support
- AST viewer

### Lua Development (lazydev)
- Provides Neovim Lua API completion
- Active only in `.lua` files

---

## 🔍 SEARCH & NAVIGATION

### Fuzzy Finder (Telescope)
- **Find files:** `<leader>ff` (Space + ff)
- **Live grep:** `<leader>fg` (Space + fg) - Search text in all files
- **Buffers:** `<leader>fb` (Space + fb) - List open buffers
- **Help tags:** `<leader>fh` (Space + fh) - Search help documentation
- **File browser:** `<leader>fe` (Space + fe) - Browse files in telescope

**Inside Telescope:**
- `Ctrl+n` / `Ctrl+p` - Navigate up/down
- `Enter` - Select item
- `Esc` - Close telescope
- `Ctrl+u` / `Ctrl+d` - Scroll preview up/down

**Features:**
- Fast fuzzy finding with fzf-native
- Live preview of files
- Integrated file browser
- Horizontal layout with prompt at top

### Search and Replace (grug-far)
- **Keybind:** `<leader>sr` (Space + sr)
- **Description:** Interactive search and replace across files
- **Features:**
  - Live preview of changes
  - Regex support
  - File filtering
  - Undo/redo support

---

## 🌳 SYNTAX & PARSING

### Treesitter
- **Better syntax highlighting** for C, Lua, and more languages
- **Automatic language installation** when opening new file types
- **Smart indentation** based on syntax tree

### Treesitter Context
- Shows current function/class at the top of the window
- Stays visible when scrolling through long functions
- Maximum 3 lines of context

### Treesitter Text Objects
Select code based on syntax structure:
- `af` - Select outer function (around function)
- `if` - Select inner function (inside function)
- `ac` - Select outer class (around class)
- `ic` - Select inner class (inside class)

**Usage examples:**
- `vaf` - Visually select entire function
- `dif` - Delete function body
- `yac` - Yank entire class

### Treesitter Playground
- **Command:** `:TSPlaygroundToggle`
- **Description:** Debug and inspect syntax tree
- **Features:**
  - View AST (Abstract Syntax Tree)
  - Highlight nodes
  - Query editor for treesitter queries

---

## 🎨 CODE VISUALIZATION

### Indent Guides (indent-blankline + mini.indentscope)
- **Dashed lines (╎):** Show all indent levels
- **Animated blue line:** Highlights current scope
- **Theme-aware:** Colors adapt to your theme

### Color Highlighting (nvim-highlight-colors)
- Automatically highlights color codes with their actual colors
- **Supported formats:**
  - Hex: `#ff0000`
  - RGB: `rgb(255, 0, 0)`
  - HSL: `hsl(0, 100%, 50%)`
  - Tailwind colors

### Whitespace Characters
- **Tabs:** Shown as `→ `
- **Trailing spaces:** Shown as `·`
- **Non-breaking spaces:** Shown as `␣`
- Helps maintain clean code formatting

### TODO Comments (todo-comments)
- Highlights special comments with colors:
  - `TODO:` - Information
  - `FIXME:` - Warning
  - `HACK:` - Warning
  - `WARNING:` - Error
  - `NOTE:` - Hint
  - `PERF:` - Performance

### Diagnostics List (trouble.nvim)
- **All diagnostics:** `<leader>xx` (Space + xx) - Show all diagnostics
- **Buffer diagnostics:** `<leader>xd` (Space + xd) - Show diagnostics for current file
- **Features:**
  - Organized list of errors, warnings, and hints
  - Jump to diagnostic location
  - Filter by severity
  - Virtual text shows errors inline at end of line

---

## 🖥️ TERMINAL

### Terminal Toggle (toggleterm)
- **Bottom terminal:** `<leader>\` (Space + \)
- **Floating terminal:** `<leader>-` (Space + -)
- **Alternative toggle:** `Ctrl+\`

**Inside terminal:**
- `Ctrl+\` - Toggle terminal visibility
- `Ctrl+w` then `h/j/k/l` - Navigate to other windows
- Type `exit` or press `Ctrl+d` - Close terminal

**Features:**
- Starts in insert mode
- Persists size across toggles
- Curved borders for floating terminal

---

## 💾 SESSION MANAGEMENT

### Session Persistence (persistence.nvim)
- **Restore session:** `<leader>qs` (Space + qs) - Restore current directory session
- **Restore last:** `<leader>ql` (Space + ql) - Restore last session
- **Don't save:** `<leader>qd` (Space + qd) - Don't save current session on exit

**Features:**
- Auto-saves session on exit
- Per-directory sessions
- Restores open files, window layout, and cursor positions

---

## ⌨️ KEYBINDINGS

### Keybinding Helper (which-key)
- **Show all keybinds:** `<leader>k` (Space + k)
- **Auto-popup:** Appears when you start a key sequence
- Shows available keybindings and descriptions

### Leader Key
- **Leader:** `Space`
- Most custom keybindings start with the leader key

### Essential Keybinds Summary

| Keybind | Action |
|---------|--------|
| `<leader>tt` | Theme switcher |
| `Ctrl+n` | Toggle file tree |
| `<leader>e` | Focus file tree |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>fb` | Buffers (Telescope) |
| `<leader>fe` | File browser (Telescope) |
| `<leader>sr` | Search and replace |
| `<leader>xx` | Diagnostics list (all) |
| `<leader>xd` | Diagnostics list (buffer) |
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Don't save session |
| `<leader>\` | Terminal (bottom) |
| `<leader>-` | Terminal (floating) |
| `<leader>k` | Show keybindings |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `af/if` | Select function (outer/inner) |
| `ac/ic` | Select class (outer/inner) |

---

## ⚙️ CONFIGURATION

### File Structure
```
nvim-config/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager setup
│   │   ├── options.lua        # Vim options
│   │   └── keymaps.lua        # Custom keymaps
│   ├── plugins/               # Plugin configurations
│   │   ├── lsp.lua           # LSP setup
│   │   ├── blink-cmp.lua     # Completion
│   │   ├── nvim-tree.lua     # File explorer
│   │   ├── telescope.lua     # Fuzzy finder
│   │   ├── treesitter.lua    # Syntax highlighting
│   │   ├── playground.lua    # Treesitter debugger
│   │   ├── themery.lua       # Theme switcher
│   │   ├── lualine.lua       # Status line
│   │   ├── noice.lua         # UI enhancements
│   │   ├── barbecue.lua      # Breadcrumbs
│   │   ├── indent-blankline.lua  # Indent guides
│   │   ├── nvim-highlight-colors.lua  # Color highlighting
│   │   ├── toggleterm.lua    # Terminal
│   │   ├── which-key.lua     # Keybind helper
│   │   ├── todo-comments.lua # TODO highlighting
│   │   ├── grug-far.lua      # Search/replace
│   │   ├── lazydev.lua       # Lua dev support
│   │   └── clangd-extensions.lua  # C/C++ extras
│   └── theme.lua             # Current theme setting
└── lazy-lock.json            # Plugin versions
```

### Options (lua/config/options.lua)
- **Line numbers:** Absolute + relative
- **Mouse:** Disabled
- **Tabs:** 4 spaces (hard tabs)
- **Indentation:** Smart indent enabled
- **Scrolloff:** 10 lines
- **Split:** Below and right
- **Search:** Case-insensitive (smart)
- **Whitespace:** Visible characters for tabs/spaces

### Customization

**Change theme:**
1. Press `<leader>tt` (Space + tt)
2. Select theme from the list
3. Theme persists automatically

**Add more themes:**
Edit `lua/plugins/themery.lua` and add theme names to the `themes` table.

**Modify keybindings:**
Edit the `keys` section in respective plugin files in `lua/plugins/`.

**Change tab size:**
Edit `lua/config/options.lua`:
```lua
vim.opt.tabstop = 2      -- Change to desired size
vim.opt.shiftwidth = 2   -- Keep same as tabstop
```

---

## 🔧 PLUGIN MANAGEMENT

### Lazy.nvim
- **Open plugin manager:** `:Lazy`
- **Update plugins:** `:Lazy update`
- **Sync plugins:** `:Lazy sync`
- **Clean unused plugins:** `:Lazy clean`
- **Check plugin status:** `:Lazy check`

### Mason (LSP/Tool Manager)
- **Open Mason:** `:Mason`
- **Install server:** Select and press `i`
- **Uninstall server:** Select and press `X`
- **Update server:** Select and press `u`

---

## 📝 PLUGIN LIST

### Core Functionality
- **lazy.nvim** - Plugin manager
- **mason.nvim** - LSP/tool installer
- **mason-lspconfig.nvim** - Bridge between mason and lspconfig
- **nvim-lspconfig** - LSP configuration
- **blink.cmp** - Autocompletion engine
- **friendly-snippets** - Code snippets collection

### C/C++ Development
- **clangd** - C/C++ language server
- **clangd_extensions.nvim** - Enhanced clangd features
- **clang-format** - Code formatter

### Syntax & Parsing
- **nvim-treesitter** - Better syntax highlighting
- **nvim-treesitter-textobjects** - Text objects based on syntax
- **nvim-treesitter-context** - Shows current function at top
- **playground** - Treesitter debugger

### UI & Appearance
- **themery.nvim** - Theme switcher
- **oscura.nvim** - Default theme
- **lualine.nvim** - Status line
- **noice.nvim** - Enhanced UI
- **barbecue.nvim** - Breadcrumbs
- **nvim-web-devicons** - File icons

### File Navigation & Search
- **nvim-tree.lua** - File explorer
- **telescope.nvim** - Fuzzy finder
- **telescope-fzf-native.nvim** - Faster telescope sorting
- **telescope-file-browser.nvim** - File browser in telescope

### Code Visualization
- **indent-blankline.nvim** - Indent guides
- **mini.indentscope** - Scope highlighting
- **nvim-highlight-colors** - Color code highlighting
- **todo-comments.nvim** - TODO/FIXME highlighting

### Utilities
- **toggleterm.nvim** - Terminal integration
- **which-key.nvim** - Keybinding helper
- **grug-far.nvim** - Search and replace
- **lazydev.nvim** - Lua development support
- **plenary.nvim** - Lua utility functions
- **trouble.nvim** - Diagnostics list
- **persistence.nvim** - Session management

---

## 🐛 TROUBLESHOOTING

### LSP not working
1. Check if clangd is installed: `:Mason`
2. Restart LSP: `:LspRestart`
3. Check LSP status: `:LspInfo`

### Plugins not loading
1. Update plugins: `:Lazy sync`
2. Check for errors: `:Lazy log`
3. Restart Neovim

### Theme not persisting
- Check if `lua/theme.lua` exists and is writable
- Verify themery config points to correct path

### Completion not working
1. Ensure LSP is running: `:LspInfo`
2. Check blink.cmp status: `:checkhealth blink`
3. Restart Neovim

### Terminal not opening
- Check toggleterm installation: `:Lazy`
- Verify keybindings: `<leader>k`

---

## 📚 RESOURCES

- **Neovim Documentation:** `:help`
- **Plugin Documentation:** `:help <plugin-name>`
- **Lazy.nvim:** https://github.com/folke/lazy.nvim
- **Mason:** https://github.com/williamboman/mason.nvim
- **LSP Config:** https://github.com/neovim/nvim-lspconfig

---

## 🎯 TIPS & TRICKS

1. **Learn incrementally:** Don't try to memorize all keybindings at once. Use `<leader>k` to discover them.

2. **Use LSP features:** Press `K` on any function/variable to see documentation.

3. **Fuzzy finding:** Use `<leader>ff` for quick file navigation, `<leader>fg` for searching text across your project.

4. **Search efficiently:** Use `<leader>sr` for project-wide search and replace with live preview.

5. **Terminal workflow:** Keep a terminal open at the bottom with `<leader>\` for quick commands.

6. **Theme experimentation:** Try different themes with `<leader>tt` to find what works best for you.

7. **File navigation:** Use `<leader>e` to quickly jump between code and file tree, or `<leader>fe` for telescope file browser.

8. **Code navigation:** Use `gd` to jump to definitions and `Ctrl+o` to jump back.

9. **Visual feedback:** Pay attention to indent guides and scope highlighting to understand code structure.

10. **Text objects:** Use `vaf` to select entire functions, `dif` to delete function bodies - works with any vim motion.

11. **Treesitter context:** The function name at the top helps you stay oriented in long files.

12. **Telescope preview:** Use `Ctrl+u/d` to scroll through file previews without opening them.

---

## 📄 LICENSE

This configuration is free to use and modify for personal or educational purposes.

---

**Last Updated:** November 23, 2025
**Neovim Version:** 0.11+
**Maintained by:** abdessel
