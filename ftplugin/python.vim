let s:slash = !exists("+shellslash") || &shellslash ? '/' : '\'

call switchy#add('python', {->
	 \ switchy#has_prefix(bufname(''), 'tests/test_')
         \ ? bufname('')[len('tests/test_'):]
         \ : getcwd() .. s:slash .. 'tests' .. s:slash .. 'test_' .. fnamemodify(bufname(''), ':t')})
