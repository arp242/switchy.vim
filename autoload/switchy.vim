let s:callbacks = {}

" Add a new filetype callback. The callback function is expected to return a new
" filename to edit based on the current filename.
fun! switchy#add(filetype, callback) abort
	let s:callbacks[a:filetype] = a:callback
endfun

" Try to switch to a related file.
fun! switchy#switch(cmd, cmd_loaded) abort
	let l:Fun = get(s:callbacks, &filetype, v:null)
	if l:Fun is# v:null
		return switchy#error(printf('nothing defined for filetype "%s"', &filetype))
	endif
	if bufname('') is# ''
		return switchy#error('no buffer name')
	endif

	let l:cmd        = (empty(a:cmd)        ? 'edit'  : a:cmd)
	let l:cmd_loaded = (empty(a:cmd_loaded) ? 'sbuf'  : a:cmd_loaded)
	let l:file       = call(l:Fun, [])
	exe printf(':%s %s',
			\ (bufloaded(l:file) ? l:cmd_loaded : l:cmd),
			\ l:file)
endfun

" Display an error message.
fun! switchy#error(msg) abort
	echohl Error
	echo 'switchy.vim: ' . a:msg
	echohl None
endfun

" Report if s begins with prefix.
fun! switchy#has_prefix(s, prefix) abort
  return a:s[:len(a:prefix) - 1] is# a:prefix
endfun

" Report if s ends with suffix.
fun! switchy#has_suffix(s, suffix) abort
  return a:s[-len(a:suffix):] is# a:suffix
endfun
