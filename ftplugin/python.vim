call switchy#add('python', {->
	 \ switchy#has_prefix(bufname(''), 'tests/test_')
         \ ? bufname('')[len('tests/test_'):]
         \ : 'tests/test_' .. bufname('')})
