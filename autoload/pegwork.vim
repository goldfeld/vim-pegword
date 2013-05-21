"" =============================================================================
"" File:          autoload/pegwork.vim
"" License:       see /plugin/pegword.vim
"" =============================================================================

let s:pegwords = {
  \ 'saw': 0, 'tie': 1, 'knee': 2, 'moe': 3, 'ra': 4,
   \ 'law': 5, 'shoe': 6, 'key': 7, 'ivy': 8, 'pie': 9,
  \ 'toes': 10, 'tot': 11, 'dune': 12, 'dam': 13, 'tyre': 14,
   \ 'towel': 15, 'tissue': 16, 'duck': 17, 'dove': 18, 'tap': 19,
  \ 'nose': 20, 'nut': 21, 'nun': 22, 'gnome': 23, 'nero': 24,
   \ 'nail': 25, 'niche': 26, 'neck': 27, 'knife': 28, 'nib': 29,
  \ 'mace': 30, 'mead': 31, 'moon': 32, 'mummy': 33, 'mower': 34,
   \ 'mail': 35, 'match': 36, 'mug': 37, 'movie': 38, 'map': 39,
  \ 'rose': 40, 'root': 41, 'rein': 42, 'rum': 43, 'rower': 44,
   \ 'reel': 45, 'roach': 46, 'rogue': 47, 'reef': 48, 'rabbi': 49,
  \ 'lasso': 50, 'led': 51, 'lion': 52, 'llama': 53, 'lyre': 54,
   \ 'lily': 55, 'leech': 56, 'log': 57, 'lava': 58, 'loupe': 59,
  \ 'cheese': 60, 'sheet': 61, 'chain': 62, 'chime': 63, 'chair': 64,
   \ 'cello': 65, 'shush': 66, 'shake': 67, 'chef': 68, 'ship': 69,
  \ 'case': 70, 'cat': 71, 'can': 72, 'comb': 73, 'car': 74,
   \ 'coil': 75, 'couch': 76, 'cake': 77, 'cave': 78, 'cap': 79,
  \ 'vase': 80, 'foot': 81, 'vine': 82, 'foam': 83, 'fire': 84,
   \ 'vial': 85, 'fish': 86, 'fig': 87, 'fifa': 88, 'vip': 89,
  \ 'bus': 90, 'bat': 91, 'bone': 92, 'beam': 93, 'pear': 94,
   \ 'bull': 95, 'patch': 96, 'bike': 97, 'beef': 98, 'pipe': 99,
  \ 'seesaw': '00', 'suit': '01', 'sun': '02', 'sumo': '03', 'sir': '04',
  \ 'seal': '05', 'sash': '06', 'sock': '07', 'safe': '08', 'soup': '09'
  \ }
" peg word dictionary adapted from:
" http://memoryskills.blogspot.com.br/2009/07/my-list-of-100-peg-words.html

let s:maxLength = 0
for peg in keys(s:pegwords)
  if len(peg) > s:maxLength
    let s:maxLength = len(peg)
  endif
endfor

function! pegwork#begin(...)
  let times = 1
  if a:0 == 1 | let l:times = a:1 | endif

  for iteration in range(l:times)
    let word = ''
    let char = getchar()

    while len(l:word) < s:maxLength
      if l:char == 27
        startinsert
        return
      endif

      if l:char < 97 || l:char > 122
        let l:char = getchar()
        continue
      endif

      let word = l:word . nr2char(l:char)
      let number = get(s:pegwords, l:word, -1)
      if l:number != -1
        execute "normal! a" . l:number
        startinsert
        break
      endif
      let l:char = getchar()
    endwhile

  endfor
  call cursor('.', getpos('.')[2] + 1)
endfunction

function! pegwork#float(...)
  call pegwork#begin(1)
  execute "normal! i.\<Esc>"
  call cursor('.', getpos('.')[2] + 2)
endfunction
