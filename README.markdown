Switch to related files.

Usage: map `switchy#switch()` to something, for example:

    nnoremap <silent> <Leader>a :call switchy#switch('tabedit', 'sbuf')<CR>

Or use a command if you prefer:

    command! Switch call switchy#switch('split', 'sbuf')

The first function argument is the command to use when editing a file (e.g.
`edit`, `split`, `tabedit`, `sbuf`, etc.), the second argument is the command to
use when the buffer is already loaded. This is useful to switch to an existing
split/tab instead of opening a new one.

You can add your own callbacks with `switchy#add()`; see
[ftplugin/go.vim](ftplugin/go.vim) for an example.

---

Supported filetypes:

- C: `a.c` ⇄ `a.h`
- Go: `a.go` ⇄ `a_test.go`

Yeah, it's early days for this plugin. More filetypes soon™

---

Survey of existing methods:

- [a.vim](https://www.vim.org/scripts/script.php?script_id=31):
  Too many commands, only supports C/C++ out of the box.

- [FSwitch](https://www.vim.org/scripts/script.php?script_id=2590):
  Too many commands, only supports C/C++ out of the box.

- [vim-altr](https://github.com/kana/vim-altr):
  Doesn't load buffer if file doesn't exist, don't like the code (tried to patch
  this).

- [alternate-lite](https://github.com/LucHermitte/alternate-lite):
  Needs lh-vim-lib, too many commands.

- [unimpaired.vim](https://github.com/tpope/vim-unimpaired):
  Kinda works, not really intended for this and can't create new file easily.

- Manual:

      :e %<.c
      nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

  It's okay, but not as fast as e.g. `<Leader>a`, also not flexible to multiple
  filetypes etc.
