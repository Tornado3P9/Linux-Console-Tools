## echo

```bash
echo hello world # hello world

echo "hello world" # hello world

echo "$(which echo)" # /bin/echo

echo "$(which echo)" > echo.txt # "/bin/echo" gets pasted into the file "echo.txt"

echo "$(which echo)" | tee echo.txt # "/bin/echo" gets pasted into the file "echo.txt" and to the terminal
```

```bash
echo -e "This is a long line of text\nsplit across three lines\nwith\ttabs\ton\tthe\tthird\tline"

# The -e (enable backslash escapes) option lets us use some backslash-escaped characters to change the layout of the text.
# These are the backslash-escaped characters we can use:
#
#    \a: Alert (historically known as BEL). This generates the default alert sound.
#    \b: Writes a backspace character.
#    \c: Abandons any further output.
#    \e: Writes an escape character.
#    \f: Writes a form feed character.
#    \n: Writes a new line.
#    \r: Writes a carriage return.
#    \t: Writes a horizontal tab.
#    \v: Writes a vertical tab.
#    \\: Writes a backslash character.
```

```bash
Tipp: Checking a bash command with 'echo' before executing!
user@pc:~$ echo *.mp4
-> video1.mp4, video2.mp4, video3.mp4
user@pc:~$ rm *.mp4
```

```bash
Examples of using the echo command in a bash script (both scripts do essentialy the same):

#!/bin/bash
echo -n "Enter something: "  # (-n) do not output the trailing newline
read SOMETHING
echo $SOMETHING

#!/bin/bash
read -p "Enter something: " SOMETHING
echo $SOMETHING
```

```bash
echo f{oo,ee,a}d # food feed fad

for num in {000..2}; do echo "$num"; done
# 000
# 001
# 002

echo {00..8..2} # 00 02 04 06 08

echo {D..T..4} # D H L P T
```

```bash
STRING="thisisaverylongname"

echo ${STRING:4} # isaverylongname

echo ${STRING:6:5} # avery

echo ${ARRAY[*]} # one two one three one four

echo ${ARRAY[*]#one} # two three four

echo ${ARRAY[*]#t} # one wo one hree one four

echo ${ARRAY[*]#t*} # one wo one hree one four

echo ${ARRAY[*]##t*} # one one one four

echo $STRING # thisisaverylongname

echo ${STRING%name} # thisisaverylong

echo ${STRING/name/string} # thisisaverylongstring
```

