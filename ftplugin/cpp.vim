fun! s:Cb()
	let [base, ext] = [expand('%:t:r'), expand('%:t:e')]
	if ext ==# 'h'
		return base .. (filereadable(base .. '.cpp') ? '.cpp' : '.c')
	endif
    return base .. '.h'
endfun
call switchy#add('cpp', funcref('s:Cb'))
