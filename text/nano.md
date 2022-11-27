## UNIX Texteditor for Terminal
https://nano-editor.org/dist/latest/cheatsheet.html

```bash
# show line numbers
nano --linenumbers filename.txt
```

If you would like to make edits at/to a specific word in the text, then you need to do the following:  
→ Hit Alt+M to enable "mouse support mode".  
→ Double click on the word of choice and this will switch on marking (mark set/unset).  
  When you click on the word of choice and marking is set on, then select the word or the text of choice using the mouse  
  (exactly like how you usually select text in any word editor e.g. gedit).  
  Or, alternatively you can hit Ctrl+6 to enable marking, then Ctrl+space to select the word/text that you would like to edit.  
→ Use Ctrl+H to delete the characters of that selected word, or alternatively use Ctrl+K to cut (delete) the selected word/text when mouse support mode is enabled.  

```bash
# To activate "undo/redo" mode, you’ll need to start nano with the -u option
# and then you can use Alt+U to undo and Alt+E to redo.
nano -u file.txt
```
