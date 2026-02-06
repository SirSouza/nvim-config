# 🚀 Minha Configuração do Neovim / My Neovim Configuration

<details>
<summary>🇧🇷 Português</summary>

## 📖 Sobre

Configuração minimalista e funcional do Neovim com LSP, autocomplete e syntax highlighting.

## ✨ Features

- 🎨 **Temas**: Catppuccin e Material
- 📊 **Statusline**: Lualine com ícones
- 🌳 **Syntax Highlighting**: Treesitter
- 🔧 **LSP**: Suporte completo para múltiplas linguagens
- ⚡ **Autocomplete**: nvim-cmp integrado com LSP
- 📁 **File Explorer**: Neo-tree
- 🔗 **Autopairs**: Fecha parênteses e colchetes automaticamente

## 📦 Plugins

### Core
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Gerenciador de plugins
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configuração LSP
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Instalador de LSP
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Ponte mason + lspconfig

### UI
- [catppuccin/nvim](https://github.com/catppuccin/nvim) - Tema Catppuccin
- [material.nvim](https://github.com/marko-cerovac/material.nvim) - Tema Material
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - Explorador de arquivos

### Edição
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Motor de autocomplete
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Fecha pares automaticamente

## 🛠️ Language Servers

- `lua_ls` - Lua
- `ts_ls` - TypeScript/JavaScript
- `html` - HTML
- `cssls` - CSS
- `jsonls` - JSON
- `bashls` - Bash

## 📂 Estrutura
```
~/.config/nvim/
├── init.lua              # Ponto de entrada
├── lazy-lock.json        # Versões dos plugins (gitignored)
└── lua/
    └── anorak/
        ├── core.lua      # Configurações básicas
        ├── plugins.lua   # Declaração de plugins
        ├── lsp.lua       # Configuração LSP
        └── cmp.lua       # Configuração autocomplete
```

## 🚀 Instalação

### Pré-requisitos

- Neovim >= 0.9.0
- Git
- Um [Nerd Font](https://www.nerdfonts.com/) (para ícones)
- Node.js (para ts_ls)
- Compilador C (gcc/clang para Treesitter)

### Passos

1. **Backup da configuração atual (se existir)**
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. **Clone este repositório**
```bash
git clone https://github.com/SEU_USER/nvim-config.git ~/.config/nvim
```

3. **Abra o Neovim**
```bash
nvim
```

O Lazy.nvim irá instalar todos os plugins automaticamente na primeira execução.

4. **Instale os Language Servers**

Abra o Neovim e execute:
```vim
:MasonInstallAll
```

Ou espere que o Mason instale automaticamente os LSPs configurados.

## ⚙️ Configurações Principais

### Opções do Editor
```lua
vim.opt.number = true              -- Números de linha
vim.opt.relativenumber = true      -- Números relativos
vim.opt.tabstop = 2                -- Tab = 2 espaços
vim.opt.shiftwidth = 2             -- Indentação = 2 espaços
vim.opt.expandtab = true           -- Usa espaços ao invés de tabs
vim.opt.cursorline = true          -- Destaca linha atual
```

### Atalhos Padrão

#### Neo-tree
- `<Space>e` ou `:Neotree` - Abrir/fechar explorador de arquivos

#### LSP
- `gd` - Ir para definição
- `K` - Mostrar documentação
- `<leader>rn` - Renomear símbolo
- `<leader>ca` - Ações de código

#### Autocomplete
- `<C-Space>` - Abrir autocomplete
- `<CR>` - Confirmar seleção
- `<ESC>` - Fechar autocomplete

## 🎨 Temas

Para ativar um tema, adicione no `lua/anorak/core.lua`:
```lua
-- Catppuccin
vim.cmd.colorscheme("catppuccin")

-- Material
vim.cmd.colorscheme("material")
```

## 📝 Personalização

### Adicionar um novo LSP

1. Adicione o LSP em `lua/anorak/lsp.lua`:
```lua
require("mason-lspconfig").setup({
  ensure_installed = {
    -- ... outros LSPs
    "novo_lsp",  -- adicione aqui
  },
})

-- Configure o LSP
vim.lsp.config("novo_lsp", {
  capabilities = capabilities,
})

-- Adicione ao enable
vim.lsp.enable({
  -- ... outros
  "novo_lsp",
})
```

### Adicionar um novo plugin

1. Adicione em `lua/anorak/plugins.lua`:
```lua
{
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({})
  end,
},
```

2. Reinicie o Neovim e execute `:Lazy sync`

## 🐛 Troubleshooting

### LSP não está funcionando
```vim
:LspInfo          " Verificar status do LSP
:Mason            " Verificar LSPs instalados
:checkhealth      " Diagnóstico geral
```

### Treesitter com erros
```vim
:TSUpdate         " Atualizar parsers
:TSInstall lua    " Instalar parser específico
```

### Plugins não carregando
```vim
:Lazy sync        " Sincronizar plugins
:Lazy clean       " Limpar plugins não usados
```

## 📚 Recursos

- [Documentação oficial do Neovim](https://neovim.io/doc/)
- [Lazy.nvim docs](https://github.com/folke/lazy.nvim)
- [LSP config docs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## 📄 Licença

MIT License - sinta-se livre para usar e modificar!

</details>

---

<details>
<summary>🇺🇸 English</summary>

## 📖 About

Minimalist and functional Neovim configuration with LSP, autocomplete, and syntax highlighting.

## ✨ Features

- 🎨 **Themes**: Catppuccin and Material
- 📊 **Statusline**: Lualine with icons
- 🌳 **Syntax Highlighting**: Treesitter
- 🔧 **LSP**: Full support for multiple languages
- ⚡ **Autocomplete**: nvim-cmp integrated with LSP
- 📁 **File Explorer**: Neo-tree
- 🔗 **Autopairs**: Auto-close parentheses and brackets

## 📦 Plugins

### Core
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge mason + lspconfig

### UI
- [catppuccin/nvim](https://github.com/catppuccin/nvim) - Catppuccin theme
- [material.nvim](https://github.com/marko-cerovac/material.nvim) - Material theme
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - File explorer

### Editing
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocomplete engine
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto close pairs

## 🛠️ Language Servers

- `lua_ls` - Lua
- `ts_ls` - TypeScript/JavaScript
- `html` - HTML
- `cssls` - CSS
- `jsonls` - JSON
- `bashls` - Bash

## 📂 Structure
```
~/.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin versions (gitignored)
└── lua/
    └── anorak/
        ├── core.lua      # Basic settings
        ├── plugins.lua   # Plugin declarations
        ├── lsp.lua       # LSP configuration
        └── cmp.lua       # Autocomplete configuration
```

## 🚀 Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- Node.js (for ts_ls)
- C compiler (gcc/clang for Treesitter)

### Steps

1. **Backup current config (if exists)**
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. **Clone this repository**
```bash
git clone https://github.com/YOUR_USER/nvim-config.git ~/.config/nvim
```

3. **Open Neovim**
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first run.

4. **Install Language Servers**

Open Neovim and run:
```vim
:MasonInstallAll
```

Or wait for Mason to automatically install configured LSPs.

## ⚙️ Main Settings

### Editor Options
```lua
vim.opt.number = true              -- Line numbers
vim.opt.relativenumber = true      -- Relative numbers
vim.opt.tabstop = 2                -- Tab = 2 spaces
vim.opt.shiftwidth = 2             -- Indentation = 2 spaces
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.cursorline = true          -- Highlight current line
```

### Default Keybindings

#### Neo-tree
- `<Space>e` or `:Neotree` - Open/close file explorer

#### LSP
- `gd` - Go to definition
- `K` - Show documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions

#### Autocomplete
- `<C-Space>` - Open autocomplete
- `<CR>` - Confirm selection
- `<ESC>` - Close autocomplete

## 🎨 Themes

To activate a theme, add to `lua/anorak/core.lua`:
```lua
-- Catppuccin
vim.cmd.colorscheme("catppuccin")

-- Material
vim.cmd.colorscheme("material")
```

## 📝 Customization

### Add a new LSP

1. Add the LSP in `lua/anorak/lsp.lua`:
```lua
require("mason-lspconfig").setup({
  ensure_installed = {
    -- ... other LSPs
    "new_lsp",  -- add here
  },
})

-- Configure the LSP
vim.lsp.config("new_lsp", {
  capabilities = capabilities,
})

-- Add to enable
vim.lsp.enable({
  -- ... others
  "new_lsp",
})
```

### Add a new plugin

1. Add to `lua/anorak/plugins.lua`:
```lua
{
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({})
  end,
},
```

2. Restart Neovim and run `:Lazy sync`

## 🐛 Troubleshooting

### LSP not working
```vim
:LspInfo          " Check LSP status
:Mason            " Check installed LSPs
:checkhealth      " General diagnostics
```

### Treesitter errors
```vim
:TSUpdate         " Update parsers
:TSInstall lua    " Install specific parser
```

### Plugins not loading
```vim
:Lazy sync        " Sync plugins
:Lazy clean       " Clean unused plugins
```

## 📚 Resources

- [Official Neovim documentation](https://neovim.io/doc/)
- [Lazy.nvim docs](https://github.com/folke/lazy.nvim)
- [LSP config docs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## 📄 License

MIT License - feel free to use and modify!

</details>
