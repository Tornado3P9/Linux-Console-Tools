## Dynamic Real-Time View of Processes(top)

```bash
# starting top
top

# top shortcuts while it's running
h       # => getting help
space   # => manual refresh
d       # => setting the refresh delay in seconds
q       # => quitting top
u       # => display processes of a user
m       # => changing the display for the memory
1       # => individual statistics for each CPU
x/y     # => highlighting the running process and the sorting column
b       # => toggle between bold and text highlighting
<       # => move the sorting column to the left
>       # => move the sorting column to the right
F       # => entering the Field Management screen to change the columns that you want to be displayed
W       # => saving top settings
e       # => changing type between Bytes,MB,GB,TB,..
P       # => sort by processor
M       # => sort by memory
     
# running top in batch mode (3 refreshes, 1 second delay) and save the whole thing to a text file
top -d 1 -n 3 -b > top_processes.txt

# looking for changes of 'docker' between the three iterations in the just generated text file
grep docker top_processes.txt


## finding the description for the MEMORY-fields:
man top
# Now just highlight 'DESCRIPTIONS of Fields' in the OVERVIEW Table of Contents and press the Middle_Mouse_Button
# On Linux based systems this has got the same effect like 'Ctrl+C, Ctrl+V'. Ofcourse you can just type it.
/DESCRIPTIONS of Fields
# Afterwards use 'n' for going forward and 'N' for going backward
# After typing 'n' once you should arrive at the chapter concerning memory
```
