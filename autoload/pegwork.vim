"" =============================================================================
"" File:          autoload/pegwork.vim
"" License:       see /plugin/pegword.vim
"" =============================================================================

let s:pegwords = {
  " Neo from Matrix; Moe from The Simpsons; Ra the Egyptian God.
  \ 'saw': 0, 'tie': 1, 'neo': 2, 'moe': 3, 'ra': 4,
   \ 'law': 5, 'shoe': 6, 'key': 7, 'ivy': 8, 'pie': 9,
  " Tot is a small child.
  \ 'toes': 10, 'tot': 11, 'dune': 12, 'dam': 13, 'tire': 14,
   \ 'towel': 15, 'tissue': 16, 'duck': 17, 'dove': 18, 'tap': 19,
  " Nemo the fish (or Captain Nemo); Nero the Roman Emperor.
  \ 'nose': 20, 'nut': 21, 'nun': 22, 'nemo': 23, 'nero': 24,
  " Nib is the tip of quill pen.
   \ 'nail': 25, 'niche': 26, 'nuke': 27, 'knife': 28, 'nib': 29,
  " Mead is a classic alcoholic beverage made from honey; Egyptian mummy.
  \ 'mace': 30, 'mead': 31, 'moon': 32, 'mummy': 33, 'mower': 34,
   \ 'mail': 35, 'match': 36, 'mug': 37, 'movie': 38, 'map': 39,
  \ 'rice': 40, 'root': 41, 'rein': 42, 'rum': 43, 'rower': 44,
   \ 'reel': 45, 'roach': 46, 'rogue': 47, 'reef': 48, 'rabbi': 49,
  \ 'lasso': 50, 'led': 51, 'lion': 52, 'limo': 53, 'lyre': 54,
   \ 'lily': 55, 'leech': 56, 'log': 57, 'lava': 58, 'loupe': 59,
  \ 'cheese': 60, 'sheet': 61, 'chain': 62, 'chime': 63, 'chair': 64,
   \ 'cello': 65, 'shush': 66, 'shake': 67, 'chef': 68, 'ship': 69,
  \ 'case': 70, 'cat': 71, 'can': 72, 'comb': 73, 'car': 74,
   \ 'coil': 75, 'couch': 76, 'cake': 77, 'cave': 78, 'cap': 79,
  \ 'vase': 80, 'foot': 81, 'vine': 82, 'foam': 83, 'fire': 84,
  " FIFA the Soccer Organization; VIP, an important hostage or guest.
   \ 'vial': 85, 'fish': 86, 'fig': 87, 'fifa': 88, 'vip': 89,
  \ 'bus': 90, 'bat': 91, 'bone': 92, 'beam': 93, 'pear': 94,
   \ 'bull': 95, 'patch': 96, 'bike': 97, 'beef': 98, 'pipe': 99,
  " Sir, a Knight or someone like Newton.
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
    let hint = ''
    let char = getchar()

    while len(l:word) < s:maxLength
      if l:char < 97 || l:char > 122
        " if esc is pressed, end minor mode.
        if l:char == 27
          return

        " if it's a number, save it in case the person is trying to get hinted;
        " but don't add it to the word building.
        elseif l:char >= 48 && l:char <= 57
          let l:hint = l:hint . nr2char(l:char)

        " if the user presses enter, give him the hint and end minor mode.
        elseif l:char == 13
          if len(l:hint)
            for word in keys(s:pegwords)
              if s:pegwords[word] == l:hint
                let rev = 1
                while l:char != 27 && l:rev <= len(word)
                  let l:reveal = strpart(word, 0, l:rev)
                  echom l:reveal

                  let l:rev = l:rev + 1
                  let l:char = getchar()
                endwhile
                return
              endif

            endfor
          endif
          return
        endif

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
