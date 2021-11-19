#### VIM tips and hints
https://www.keycdn.com/blog/vim-commands  # useful cheat sheet


### Modes ### 
esc  # command mode: 
i  # insert mode: edit file directly, insert characters
v  # visual
V  # visual line
Ctrl + v  # visual block
- (select, I, edit, esc: applies changes in one line of selection to all)

## Command Mode ##
:q  # quit
:w  # write the current state to the file (save?)
:wq  # save and exit
:q!  # quit and don't save


## Searching ##
/word  # searches for "word". Enter brings cursor to first letter of search
    n  # next match
    N  # previous match
%  # selects whole file
:%s/origninal/replacement/  # replace "original" with "replacement". First occurance only 
:%s/origninal/replacement/g  # (/g) replace ALL occurances. (/c) asks for confirmation for each replacement
  # (when searching for newline: \n, when replacing newline: \r).

## Navigation ##
(Think top right to bottom left for hjkl movement)
l  # move right one character
k  # move up one line
j  # move down one line
h  # move left one character

$  # move to end of line
  A  # append: move cursor to end of line an change to insert mode
^  # move to beginning of line
G  # move to last line of file 
Ctrl + home  # move to beginning of file
B  # move to the end of the word
W  # move to the beginning of the word
#16  # moves 16 lines down

## Editing ##
d
dd or D  # delete to end of line
S  # delete whole line
3dd  # delete next three lines

y  # copy (yank)

u  # undo actions
ctrl + r  # redo actions

:set number  # number lines

