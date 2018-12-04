func! mybootstrap#before() abort
  call mybootstrap#vundle_install()  
  let g:rspec_command = 'Dispatch! rspec {spec}'
  call mybootstrap#unite_source_options()
  call mybootstrap#rg_options()
endf

func! mybootstrap#after() abort
  call mybootstrap#rspec_mappings()
endf

func! mybootstrap#vundle_install() abort
  " Set up Vundle by run git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim
  set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
  call vundle#begin('~/.dotfiles/vim/bundle')
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'mxw/vim-jsx'
  Plugin 'chiel92/vim-autoformat'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-dispatch'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'slim-template/vim-slim'
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
