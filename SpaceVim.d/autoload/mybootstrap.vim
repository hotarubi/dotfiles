func! mybootstrap#before() abort
  call mybootstrap#vundle_install()  
  let g:rspec_command = 'Dispatch! rspec {spec}'
  call mybootstrap#unite_source_options()
  call mybootstrap#rg_options()
endf

func! mybootstrap#after() abort
  call mybootstrap#rspec_mappings()
  call mybootstrap#autoformat_mappings()
endf

func! mybootstrap#vundle_install() abort
  " Set up Vundle by run git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim
  set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
  call vundle#begin('~/.dotfiles/vim/bundle')
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'chiel92/vim-autoformat'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'jvirtanen/vim-hcl'
  call vundle#end()
  filetype plugin indent on
endf

func! mybootstrap#unite_source_options() abort
  let g:unite_source_rec_async_command = 
  \ ['ag', '--nogroup', '--nocolor', '--column', '--hidden',
  \  '--ignore', '.git',
  \  '--ignore', 'dist',
  \  '--ignore', 'node_modules',
  \  '--ignore', 'build',
  \  '--ignore', 'tmp',
  \  '--ignore', 'coverage',
  \  '--ignore', '.bundle',
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

func! mybootstrap#rg_options() abort
  let rg_profile = SpaceVim#mapping#search#getprofile('rg')
  let rg_default_opt = rg_profile.default_opts + ['-g', '!db/migrate', '-g', '!db/views', '-g', '!db/schema.rb', '-g', '!*.csv']
  call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : rg_default_opt}})
endf

func! mybootstrap#autoformat_mappings() abort
  let g:_spacevim_mappings_space.x.f = {'name' : '+Autoformat'}
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 'a'],
        \ 'Autoformat',
        \ 'Auto-format', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 's'],
        \ 'Autoformat sql',
        \ 'Format SQL', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 'j'],
        \ 'Autoformat JSON',
        \ 'Format JSON', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 'J'],
        \ 'Autoformat javascript',
        \ 'Format Javascript', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 'c'],
        \ 'Autoformat css',
        \ 'Format CSS', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 'x'],
        \ 'Autoformat xml',
        \ 'Format XML', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['x', 'f', 'h'],
        \ 'Autoformat html',
        \ 'Format HTML', 1)
endf

func! mybootstrap#rspec_mappings() abort
  let g:_spacevim_mappings_space.r.r = {'name' : '+Rspec'}
  call SpaceVim#mapping#space#langSPC('nmap', ['r', 'r', 'c'],
        \ 'call RunCurrentSpecFile()',
        \ 'Run Current Spec', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['r', 'r', 'n'],
        \ 'call RunNearestSpec()',
        \ 'Run Nearest Spec', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['r', 'r', 'l'],
        \ 'call RunLastSpec()',
        \ 'Run Last Spec', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['r', 'r', 'a'],
        \ 'call RunAllSpecs()',
        \ 'Run All Spec', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['r', 'r', 'o'],
        \ 'call dispatch#copen(!0)',
        \ 'Open Spec Result', 1)
endf
