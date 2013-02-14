let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '--format progress -I .', 'outputter': 'buffer:filetype=rspec-result'}
nnoremap <buffer> t<Space> :<C-u>!bundle exec rspec -c -fs -b %:p<CR>
