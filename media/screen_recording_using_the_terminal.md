# Screen recording using the terminal

## Find available video devices:
```bash
# use v4l-utils
sudo apt install v4l-utils
v4l2-ctl --list-devices

# or grab the video device files directly
ls /dev/vide*
```
Then check the video device health by simply playing the data:
```bash
mpv /dev/video0
```

## Find available audio devices:
```bash
arecord -l
```
You can also check the audio device health with mpv player after converting the raw data:
```bash
arecord -D hw:0,0 -f cd -t wav | mpv -
arecord -D hw:1,0 -f cd -t wav | mpv -
arecord -D hw:2,0 -f cd -t wav | mpv -
```

## Record desktop with audio from a microphone

Trying **`-i default`** option:
```bash
ffmpeg -f x11grab -r 30 -i :0.0 -f alsa -i default -acodec aac -vcodec libx264 -preset ultrafast -qp 0 output.mp4
```

To extend the ffmpeg command to include audio from a USB microphone, you need to specify an audio input source with the -f option and the -i option for the audio device. The device name can vary, but it's often something like **`hw:1,0`** or **`plughw:1,0`**. That's where you can use the **`arecord -l`** command.

Here's an example of how you might extend the command:

```bash
ffmpeg -f x11grab -r 30 -i :0.0 -f alsa -i hw:1,0 -acodec aac -vcodec libx264 -preset ultrafast -qp 0 output.mp4
```

Now optionally start a small camera video with mpv player and move it into the corner of your screen:
```bash
mpv --no-border --ontop --geometry=20% /dev/video0
```

## Now re-encode your raw video

The video size is still very huge because the recording used the best possible quality.
Now use an encoder like HandBrake to easily encode your raw recording to a specific use case, e.g. youtube web videos:

```bash
sudo apt install handbrake
```
