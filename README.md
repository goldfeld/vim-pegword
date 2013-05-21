## Peg word memorization aid for Vim

Peg words are a mnemonic system where you associate each number to a short word, and then use these words to form stories when memorizing sequences of numbers. This plugin has a peg dictionary for numbers 0 through 99. The number 7, for instance, is represented by the sound of `k`, so the peg word for 7 is 'key', and for 77 is 'cake'. The sounds are compounded in this way to form all the peg words.  

This plugin remaps your keys 0 through 9 in insert mode to start peg word insertion minor mode. The keys {1} through {9} will expect those many words, i.e. press {1} to input one peg word, {2} for two peg words in a row, and so on. The {0} key works like {1}, except that it then puts a `.` between the two numbers entered, so for instance inputting 'suit' will insert `0.1` into your text.

The plugin comes loaded with a common and popular peg word dictionary for numbers up to 99, and any peg word can be overriden on an individual basis. If you use another popular peg word dictionary, create an issue with the dictionary in the same format as the one provided.

The keys 0-9 are thus remapped to force you to practice the peg words, as that is the whole purpose of this plugin. You may also map any shortcut to deliberately start peg word mode through the command `:Pegword N`, where N is the number of pegwords to expect. If you don't want to give up the number keys, however, just add the following to your vimrc: `let g:pegword_remap_digits = 0` (default is 1.)

## Reveal hint aid

To get acquainted with the words at first, you can have the plugin hint you at the word by revealing it one letter at a time, for each Enter press. To start it, after having pressed a key from 1 to 9, input the number you want to get hinted, e.g. 71, and press Enter. The first letter will be revealed, 'c'. Press Enter again to reveal the next, 'a', and one more time to show the full word, 'cat'. Press Esc anytime to cancel this process.
