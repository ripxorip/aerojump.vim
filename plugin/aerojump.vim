" Author: Philip <philipkarlsson@me.com>
" Description: Main entry point for the plugin: sets up prefs and autocommands
"   Preferences can be set in vimrc files and so on to configure aerojump

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

pythonx << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'pythonx'))
sys.path.insert(0, python_root_dir)

from aerojump_vim import AerojumpVimRuntime
rt = AerojumpVimRuntime(vim)

EOF

function! AerojumpHelloWorld()
    pythonx rt.hello_world()
endfunction

command! -nargs=0 AerojumpHelloWorld call AerojumpHelloWorld()

nnoremap <silent> <Plug>(AerojumpDefault) :Aerojump kbd default<Return>
nnoremap <silent> <Plug>(AerojumpSpace) :Aerojump kbd space<Return>
nnoremap <silent> <Plug>(AerojumpBolt) :Aerojump kbd bolt<Return>

nnoremap <silent> <Plug>(AerojumpFromCursorBolt) :Aerojump cursor bolt <cword> <Return>

nnoremap <silent> <Plug>(AerojumpShowLog) :AerojumpShowLog<Return>
nnoremap <silent> <Plug>(AerojumpResumeNext) :AerojumpResumeNext<Return>
nnoremap <silent> <Plug>(AerojumpResumePrev) :AerojumpResumePrev<Return>
