# arecord (alsa record) is part of the preinstalled 'alsa-utils' package (apt show alsa-utils)

https://www.howtoforge.com/tutorial/advanced-audio-control-on-linux/  
https://askubuntu.com/questions/97936/terminal-command-to-set-audio-volume  
https://www.maketecheasier.com/alsa-utilities-manage-linux-audio-command-line/  

Example:
```bash
arecord --device=hw:1,0 --format S16_LE --rate 44100 -V mono -c1 voice.wav
aplay --device=plughw:1,0 voice.wav
```

Example:
```bash
sudo apt-get install sox                             # for audio conversion
arecord -Dac108 -f S32_LE -r 16000 -c 4 hello.wav    # only support 4 channels
sox hello.wav -c 2 stereo.wav                        # convert to stereo
aplay stereo.wav                                     # play
```
