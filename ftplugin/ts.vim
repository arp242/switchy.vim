call switchy#add('typescript', {->
                        \ switchy#has_suffix(bufname(''), '.types.ts')
                                \ ? bufname('')[:-len('.types.ts')+1] .. '.ts'
                                \ : bufname('')[:-len('.ts')+1] .. 'types.ts'})
