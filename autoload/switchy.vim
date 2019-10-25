fun! switchy#do(cmd, cmd_loaded) abort
	let l:Fun = get(s:map, expand('%:e'), v:null)
	if l:Fun is# v:null
		echoerr 'Nothing defined'
		return
	endif

	let l:cmd        = (empty(a:cmd)        ? 'edit'  : a:cmd)
	let l:cmd_loaded = (empty(a:cmd_loaded) ? 'sbuf'  : a:cmd_loaded)
	let l:file       = call(l:Fun, [])
	exe printf(':%s %s',
			\ (bufloaded(l:file) ? l:cmd_loaded : l:cmd),
			\ l:file)
endfun

" Report if s begins with prefix.
fun! switchy#has_prefix(s, prefix) abort
  return a:s[:len(a:prefix) - 1] is# a:prefix
endfun

" Report if s ends with suffix.
fun! switchy#has_suffix(s, suffix) abort
  return a:s[-len(a:suffix):] is# a:suffix
endfun

" TODO: ideally I'd like this to be in ftplugin/go.vim, but not sure how to
" organize that elegantly.
"
" I also want to make it easy to have people define their own callbacks, because
" some languages have multiple testing frameworks etc. and don't want to cycle
" through all of it.
fun! s:go() abort
	return switchy#has_suffix(bufname(''), '_test.go')
            \ ? bufname('')[:-9] . '.go'
            \ : bufname('')[:-4] . '_test.go'
endfun

let s:map = {
	\ 'go': function('s:go'),
\ }
