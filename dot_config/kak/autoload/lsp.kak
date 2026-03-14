eval %sh{kak-lsp}
hook global WinSetOption filetype=(haskell|rust|python|go|javascript|typescript|c|cpp) %{
    lsp-enable-window
}

# Use pyright for python instead of default pylsp
remove-hooks global lsp-filetype-python
hook -group lsp-filetype-python global BufSetOption filetype=python %{
    # set-option buffer lsp_servers %{
    #     [pylsp]
    #     root_globs = ["requirements.txt", "setup.py", "pyproject.toml", ".git", ".hg"]
    #     settings_section = "_"
    #     [pylsp.settings._]
    #     # See https://github.com/python-lsp/python-lsp-server#configuration
    #     # pylsp.configurationSources = ["flake8"]
    #     pylsp.plugins.jedi_completion.include_params = true
    # }
    set-option buffer lsp_servers %{
        [pyright-langserver]
        root_globs = ["requirements.txt", "setup.py", "pyproject.toml", "pyrightconfig.json", ".git", ".hg"]
        args = ["--stdio"]
    }
    # set-option -add buffer lsp_servers %{
    #     [ruff]
    #     args = ["server", "--quiet"]
    #     root_globs = ["requirements.txt", "setup.py", "pyproject.toml", ".git", ".hg"]
    #     settings_section = "_"
    #     [ruff.settings._.globalSettings]
    #     organizeImports = true
    #     fixAll = true
    # }
}

# Force JS/TS to use vtsls, which is much faster than typescript-language-server
hook -group lsp-filetype-javascript global BufSetOption filetype=(?:javascript|typescript) %{
    set-option buffer lsp_servers %{
        [vtsls]
        root_globs = ["package.json", "tsconfig.json", "jsconfig.json", ".git", ".hg"]
        args = ["--stdio"]
        settings_section = "_"
        [vtsls.settings._]
        quotePreference = "single"
        # typescript.format.semicolons = "insert"
    }
    #set-option buffer lsp_servers %{
    #    [typescript-language-server]
    #    root_globs = ["package.json", "tsconfig.json", "jsconfig.json", ".git", ".hg"]
    #    args = ["--stdio"]
    #    settings_section = "_"
    #    [typescript-language-server.settings._]
    #    # quotePreference = "double"
    #    # typescript.format.semicolons = "insert"
    #}
    # set-option buffer lsp_servers %{
    #     [deno]
    #     root_globs = ["package.json", "tsconfig.json", ".git", ".hg"]
    #     args = ["lsp"]
    #     settings_section = "deno"
    #     [deno.settings.deno]
    #     enable = true
    #     lint = true
    # }
    # set-option buffer lsp_servers %opt{lsp_server_biome}
    # set-option buffer lsp_servers %{
    #     [eslint-language-server]
    #     root_globs = [".eslintrc", ".eslintrc.json"]
    #     args = ["--stdio"]
    #     workaround_eslint = true
    #     [eslint-language-server.settings]
    #     codeActionsOnSave = { mode = "all", "source.fixAll.eslint" = true }
    #     format = { enable = true }
    #     quiet = false
    #     rulesCustomizations = []
    #     run = "onType"
    #     validate = "on"
    #     experimental = {}
    #     problems = { shortenToSingleLine = false }
    #     codeAction.disableRuleComment = { enable = true, location = "separateLine" }
    #     codeAction.showDocumentation = { enable = false }
    # }
    # set-option buffer lsp_servers %{
    #     [tailwindcss-language-server]
    #     root_globs = ["tailwind.*"]
    #     args = ["--stdio"]
    #     [tailwindcss-language-server.settings.tailwindCSS]
    #     editor = {}
    # }
}

map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'

map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
map global user h ':lsp-hover<ret>' -docstring 'LSP hover'

map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
map global object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'
