func! mybootstrap#before() abort
  let g:unite_source_rec_async_command = 
  \ ['ag', '--nogroup', '--nocolor', '--column', '--hidden',
  \  '--ignore', '.git',
  \  '--ignore', 'dist',
  \  '--ignore', 'node_modules',
  \  '--ignore', 'build',
  \  '--ignore', 'tmp',
  \  '--ignore', 'coverage',
  \  '--ignore', 'public/javascripts',
  \  '--ignore', 'public/stylesheets',
  \  '--ignore', 'public/uploads',
  \  '--ignore', 'public/*.json',
  \  '--ignore', 'db/*.csv',
  \  '--ignore', 'spec/fixtures',
  \  '--ignore', 'config/wsdl',
  \  '--ignore', 'spec/cassettes',
  \  '--ignore', 'style/*.css',
  \  '--ignore', 'app/assets/fonts',
  \  '--ignore', 'app/assets/images',
  \  '--ignore', 'public/uploads',
  \  '-g', '']
endf

func! mybootstrap#after() abort
endf
