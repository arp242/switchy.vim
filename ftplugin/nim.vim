call switchy#add('nim', {->
	 \ switchy#has_prefix(bufname(''), 'test_')
         \ ? bufname('')[5:]
         \ : 'test_' .. bufname('')})
