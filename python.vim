call switchy#add('python', {->
	 \ switchy#has_prefix(bufname(''), 'test_')
         \ ? bufname('')[len('test_'):]
         \ : 'test_' .. bufname('')})
