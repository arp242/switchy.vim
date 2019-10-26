fun! s:go() abort
	return switchy#has_suffix(bufname(''), '_test.go')
            \ ? bufname('')[:-9] . '.go'
            \ : bufname('')[:-4] . '_test.go'
endfun

call switchy#add('go', function('s:go'))
