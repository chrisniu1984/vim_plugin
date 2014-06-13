" ============================================================================
" File:        Niu_Csthis.vim
" Description: Generate cscope file and update current vim
" Author:  Niu Chenguang <chrisniu1984@gmail.com>
" Version:  1.0
" Last Change: 2014-05-27
" License: GPL3
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
" ============================================================================

" Do not load this file if is has already been loaded.
if exists("loaded_niu_csthis")
    finish
endif

let loaded_niu_csthis = 1

if has("cscope")
set cscopequickfix=c-,e-,t-,s-
set cst

nmap <C-n>  :cn<CR>
nmap <C-p>  :cp<CR>
nmap <C-l>  :cl<CR>
nmap <C-c>      :cs f c <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c> :cs f s <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-g> :cs f e <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-f> :cs f f <C-R>=expand("%:t:r")<CR><CR>

function Niu_Csthis()
    let l:find = 'find ./ ! -type l -name "*.h" '
    let l:find = l:find . '-o -name "*.c" '
    let l:find = l:find . '-o -name "*.cc" '
    let l:find = l:find . '-o -name "*.cpp" '
    let l:find = l:find . '-o -name "*.hpp" '
    let l:find = l:find . '-o -name "*.C" '
    let l:find = l:find . '-o -name "*.H" '
    let l:find = l:find . '> cscope.files'
    call system(l:find)
    call system("cscope -bq -i cscope.files")
    call system("rm -f cscope.files")
    cs reset
endfunction
command CSTHIS call Niu_Csthis()

endif


