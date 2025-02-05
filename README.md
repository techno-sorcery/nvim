### Background
---
The ethos I had in mind when writing this configuration was to extend Neovim's functionality
through a *reasonable* selection of "vim-faithful" plugins, rather than amalgamating it into
an IDE like so many others. If you want a development environment that supports features 
like code compilation and debugging you're better off using Visual Studio or JetBrains 
IntelliJ/Pycharm/Clion/Elephant/Zebra/WhateverNameTheyCanThinkOfNext. If you just want to 
program or edit text with some helpful features and save debugging and compliation for the 
terminal, this is the configuration for you.

I use this configuration on a daily basis for actual software development (ie configuring Neovim), so
what you're getting is a reflection my own personal preferences as a developer. However, because it's my
personal configuration, changes are bound to be made on a whim and seemingly without reason. If you'd
like to take any parts of it and use them in your own configuration, you're welcome to so long as I'm
given adequate credit.
<br><br>

### Plugin List
---
**LSP**  
- lsp-zero: Easy LSP setup
- nvim-lspconfig: Sane LSP defaults
- mason: LSP package manager

**Autocomplete**  
- cmp-spell: Spelling autocomplete
- cmp-buffer: Buffer autocomplete
- cmp-calc: Calculator autocomplete
- cmp-nvim-lsp: LSP autocomplete
- cmp-path: Path autocomplete
- lspkind: Autocomplete type icons
- cmp_luasnip: Autocomplete snippets

**Snippets**  
- LuaSnip: Snippet manager
- friendly-snippets: Snippets for common languages

**Git**  
- gitsigns: git decorations for sign column
- vim-fugitive: git command and status bar integration

**Misc**  
- nvim-highlight-colors: Visual Studio-esque inline color previews
- which-key: Pop-up keybind legend
- indent-blankline: Lines denoting indentation levels
- nvim-web-devicons: Web dev icon set
- oil: Improved file manager
- vim-code-dark: VSCode theme, used for status bar
- vim-commentary: Selection commenting/uncommenting
- vim-airline: Improved status bar, both in function and in appearance
- nvim-autopairs: Pairs parentheses, brackets, quotes, etc.
- nvim-scrollbar: Non-interactive scrollbar displaying line statuses
<br><br>


### Theme
---
This configuration also includes its own theme, "cool.nvim", designed to be a
portmenteau of Visual Studio and Xcode-style syntax highlighting.
