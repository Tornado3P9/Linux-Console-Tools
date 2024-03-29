## mpg123

```bash
sudo apt install mpg123
```

Use the -C switch to invoke mpg123’s full control complement.
```bash
mpg123 -vC file.mp3
```

The `-v` switch provides a verbose output that shows you the Channel information, bitrate, counter and volume settings.  
To see mpg123’s controls, type ‘h’ during playback. Doing so will show the menu of available controls displayed below.  
```bash
 -= terminal control keys =-
[s]     or [ ] interrupt/restart playback (i.e. '(un)pause')
[f]     next track
[d]     previous track
[b]     back to beginning of track
[p]     loop around current position (like a damaged audio CD;-)
[.]     forward
[,]     rewind
[:]     fast forward
[;]     fast rewind
[>]     fine forward
[<]     fine rewind
[+]     volume up
[-]     volume down
[r]     RVA switch
[v]     verbose switch
[l]     list current playlist, indicating current track there
[t]     display tag info (again)
[m]     print MPEG header info (again)
[h]     this help
[q]     quit
[c]     or [C] pitch up (small step, big step)
[x]     or [X] pitch down (small step, big step)
[w]     reset pitch to zero
```

If you have a directory that contains your favorite songs, you can play them all by issuing the mpg123 command with a wildcard setting.
```bash
mpg123 -vC *.mp3
```

Alternatively use 'mpv' or 'vlc' media player
```bash
sudo apt install mpv
sudo apt install vlc
```
