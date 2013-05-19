# Peg word memorization aid for Vim

Peg words are a mnemonic system where you associate each number to a short word, and then use these words to form stories when memorizing sequences of numbers. This plugin has a peg dictionary for numbers 0 through 99. The number 7, for instance, is represented by the sound of `k`, so the peg word for 7 is 'key', and for 77 is 'cake'. The sounds are compounded in this way to form all the peg words.  

This plugin remaps your keys 0 through 9 in insert mode to start peg word insertion minor mode. This mode will output the corresponding one-digit or two-digit number as soon as an unambiguous string of characters is entered. It comes loaded with a common and popular peg word dictionary for numbers up to 99, and any peg word can be overriden on an individual basis. If you use another popular peg word dictionary, submit it as pull request.

The keys 0-9 are remapped to force you to practice the peg words, as that is the whole purpose of this plugin. You may also map any shortcut to deliberately start peg word mode through the command :Pegword. If you don't want to give up the number keys, however, just add the following to your vimrc: `let g:pegword_remap_digits = 0` (default is 1.)
