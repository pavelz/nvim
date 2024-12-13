  -- Set up nvim-cmp.
  local cmp = require'cmp'

  file = io.open( "/Users/pavel/vim-logger.log", "w+b")
  file:setvbuf("line") -- set line level buffering


  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered({max_height = 100, max_width = 100}),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['C-N'] = function ()
        file:write("JAY\n")
      end,
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.config.disable,
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --capabilities = capabilities
  --}


local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
	print("LSP started.")

	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	--map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "single",
  -- add the title in hover float window
  title = "hover"
}
)

require 'lspconfig'.racket_langserver.setup{}
require 'lspconfig'.gopls.setup{on_attach = custom_attach}
require 'lspconfig'.solargraph.setup(
                                      {
                                        on_attach = custom_attach,
                                        solargraph = {
                                          formatting = false,
                                          useBundler = true,
                                          diagnostics = true, -- lsp diagnostics are slow
                                        },
                                      }
                                      )
require 'lspconfig'.hls.setup{on_attach = custom_attach}
require 'lspconfig'.clojure_lsp.setup{}

require 'colorizer'.setup()


local popUp = {}

logFile = io.open("/Users/pavel/vim-logger.log", "a+b")
logFile:setvbuf("line")

function tableToString(t, indent)
    if(type(t) ~= "table") then
      return t 
    end
    local formatted = {}
    indent = indent or 0

    for key, value in pairs(t) do
        local valueType = type(value)
        local padding = string.rep("  ", indent)  -- Padding for nested tables
        if valueType == 'table' then
            table.insert(formatted, padding .. key .. " = {")
            table.insert(formatted, tableToString(value, indent + 1))
            table.insert(formatted, padding .. "},")
        else
            table.insert(formatted, padding .. key .. " = " .. tostring(value) .. ",")
        end
    end

    return table.concat(formatted, "\n")
end

strtrim = function(text)
  local s = 1
  for i = 1, #text do
    if not char.is_white(string.byte(text, i)) then
      s = i
      break
    end
  end

  local e = #text
  for i = #text, 1, -1 do
    if not char.is_white(string.byte(text, i)) then
      e = i
      break
    end
  end
  if s == 1 and e == #text then
    return text
  end
  return string.sub(text, s, e)
end

popUp.popUpDoc = function()
  local M = {}
  
  local function create_float_window(contents)
    local bufnr = vim.api.nvim_create_buf(false, true)
    local winnr = vim.api.nvim_open_win(bufnr, false, {
        relative = 'cursor',
        row = 1,
        col = 0,
        width = 100,
        height = 40,
        style = 'minimal',
        border = 'single',
      })

    logFile:write("\nCO:\n")
    logFile:write(tableToString(contents[1]["value"]))
    logFile:write("\n")

    vim.lsp.util.stylize_markdown(bufnr, contents[1]["value"].split("\n"), {max_width=100, max_height=40})
    vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
    -- vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, contents)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', '<cmd>bw!<CR>', {
        silent = true,
        noremap = true,
        nowait = true,
      })

    vim.api.nvim_set_current_win(winnr)
  end

  function M.show_hover_docs()
    local params = vim.lsp.util.make_position_params()
    params.textDocument = { uri = vim.uri_from_bufnr(0) }
    params.position = { line = vim.fn.line('.') - 1, character = vim.fn.col('.') - 1 }

    local result = vim.lsp.buf_request_sync(0, 'textDocument/hover', params, 100000)
    logFile:write("lsp table:\n")
    logFile:write(tableToString(result))
    logFile:write("\ntable:\n")
    --logFile:write(tableToString(result[1].result.contents))
    logFile:write("\n")

    if not result or not result[1] or not result[1].result or vim.tbl_isempty(result[1].result.contents) then
      print('No hover information available')
      return
    end

    local contents = {}
    logFile:write("ITERATTE!\n")
    logFile:write(tableToString(result))
    logFile:write(type(result[1].result.contents))
    logFile:write(tableToString(result[1].result.contents))
    logFile:write("\n")
    local content = result[1].result.contents
      if content.kind == 'markdown' then
        table.insert(contents, {kind = 'markdown', value = content.value})
      end
    
    logFile:write("\nConents\n")
    logFile:write(tableToString(contents))
    logFile:write("\n")

    create_float_window(contents)
  end

  return M
end

popUp.lofi = function()
  vim.api.nvim_command([[
  nnoremap <silent> <leader>i :lua =vim.lsp.buf.hover()<CR>
  ]])
end

local cmp_status, cmp = pcall(require, 'cmp')
if not cmp_status then
  return
end

vim.api.nvim_create_augroup('my_cmp_group', {})
vim.api.nvim_create_autocmd('InsertEnter', {
  group = 'my_cmp_group',
  callback = popUp.lofi,
})


--require('lspsaga').setup({})

return popUp
