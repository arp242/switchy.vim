call switchy#add('go', {->
	 \ switchy#has_suffix(bufname(''), '_test.go')
         \ ? bufname('')[:-9] . '.go'
         \ : bufname('')[:-4] . '_test.go'})
