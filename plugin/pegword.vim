"" =============================================================================
"" File:          plugin/pegword.vim
"" Description:   Peg word memorization aid for Vim.
"" Author:        Vic Goldfeld <vic@longstorm.org>
"" Version:       0.1
"" ReleaseDate:   2013-05-02
"" License:       MIT License (see below)
""
"" Copyright (C) 2013 Vic Goldfeld under the MIT License.
""
"" Permission is hereby granted, free of charge, to any person obtaining a 
"" copy of this software and associated documentation files (the "Software"), 
"" to deal in the Software without restriction, including without limitation 
"" the rights to use, copy, modify, merge, publish, distribute, sublicense, 
"" and/or sell copies of the Software, and to permit persons to whom the 
"" Software is furnished to do so, subject to the following conditions:
""
"" The above copyright notice and this permission notice shall be included in 
"" all copies or substantial portions of the Software.
""
"" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
"" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
"" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
"" THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
"" OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
"" ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
"" OTHER DEALINGS IN THE SOFTWARE.
"" =============================================================================

if exists('g:loaded_pegword') || &cp
	finish
endif
let g:loaded_pegword = 1

command! -nargs=? Pegword call pegwork#begin(<f-args>)

if get(g:, 'pegword_remap_digits', 1)
  inoremap <silent> 0 <Esc>:call pegwork#float()<CR>
  for dgt in range(1, 9)
    execute "inoremap <silent>" dgt "<Esc>:call pegwork#begin(" . dgt . ")<CR>"
  endfor
endif
