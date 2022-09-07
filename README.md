# starneonvim

## 整体结构：

~~~shell
├── LICENSE
├── README.md
├── init.lua
└── lua
    ├── autocmds.lua
    ├── basic.lua
    ├── colorscheme.lua
    ├── keybindings.lua
    ├── lsp
    │   ├── cmp.lua
    │   ├── config
    │   │   ├── bash.lua
    │   │   ├── emmet.lua
    │   │   ├── html.lua
    │   │   ├── json.lua
    │   │   ├── lua.lua
    │   │   ├── markdown.lua
    │   │   ├── pyright.lua
    │   │   ├── rust.lua
    │   │   └── ts.lua
    │   ├── formatter.lua
    │   ├── null-ls.lua
    │   ├── setup.lua
    │   └── ui.lua
    ├── plugin-config
    │   ├── bufferline.lua
    │   ├── comment.lua
    │   ├── dashboard.lua
    │   ├── gitsigns.lua
    │   ├── indent-blankline.lua
    │   ├── lualine.lua
    │   ├── nvim-autopairs.lua
    │   ├── nvim-tree.lua
    │   ├── nvim-treesitter.lua
    │   ├── project.lua
    │   ├── surround.lua
    │   ├── telescope.lua
    │   ├── toggleterm.lua
    │   ├── vimspector.lua
    │   └── which-key.lua
    ├── plugins.lua
    └── utils
        ├── fix-yank.lua
        ├── global.lua
        └── im-select.lua
~~~

- basic.lua： 基础配置，是对默认配置的一个重置。
- colorscheme.lua： 我们安装的主题皮肤配置，在这里切换主题。
- keybindings.lua： 快捷键的设置，所有插件的快捷键也都会放在这里。
- plugins.lua： 插件安装管理，插件安装或卸载全在这里设置。
- lsp 文件夹： 是对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等。
- config ： 文件夹包含各种语言服务器单独的配置文件。
- setup.lua ： 内置 LSP 的配置。
- cmp.lua ： 语法自动补全补全的配置，包括各种补全源，与自定义代码段。
- ui.lua： 对内置 LSP 功能增强和 UI 美化。
- formatter.lua： 独立代码格式化功能。
- plugin-config 文件夹： 是对第三方插件的配置，未来每添加一个插件，这里就多一个配置文件。
- utils 文件夹： 是对常见问题的修改，包括输入法切换，针对 windows 的特殊配置等。


## 配置入口文件:
 *~/.config/nvim/init.lua*

~~~lua
-- 基础设置
require('basic')
~~~
require 函数在 Lua 中用于加载一个模块，而这些模块通常位于 runtimepath 中的 lua/ 目录下，也就是我们的 ~/.config/nvim/lua/ 目录。

所以上边的代码，就是加载 ~/.config/nvim/lua/basic.lua 文件（注意：require 里没有 .lua 扩展名）。当然也可以创建 ~/.config/nvim/lua/basic/ 目录，在目录下边创建 init.lua 文件也是可以成功加载的。


这里用到的分类有

- vim.g.{name}: 全局变量
- vim.b.{name}: 缓冲区变量
- vim.w.{name}: 窗口变量
- vim.bo.{option}: buffer-local 选项
- vim.wo.{option}: window-local 选项


## 模糊搜索文件并快速打开
 telescope 依赖一下项目
 - [BurntSushi/ripgrep](https://link.juejin.cn/?target=https%3A%2F%2Fgithub.com%2FBurntSushi%2Fripgrep)
- [sharkdp/fd](https://link.juejin.cn/?target=https%3A%2F%2Fgithub.com%2Fsharkdp%2Ffd)

再次运行 `:checkhealth telescope`，如图，依赖都已经安装完成：

