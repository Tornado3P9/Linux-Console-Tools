To record the desktop video without audio using ffmpeg, you can use the x11grab input device, which allows you to capture the content of your X11 screen. Here's a basic command to record the desktop video:

```bash
ffmpeg -f x11grab -i :0.0 -vcodec libx264 -preset ultrafast -qp 0 output.mp4
```

Explanation of the options:

- **`-f x11grab`**: Specifies the input format to be X11 screen capture.
- **`-i :0.0`**: Defines the input source, where :0.0 is the display and screen number of your X11 session (default for the first display and screen).
- **`-vcodec libx264`**: Sets the video codec to libx264 for H.264 encoding.
- **`-preset ultrafast`**: Uses the ultrafast preset for minimal compression to achieve a faster encoding speed, which is useful for capturing video in real-time.
- **`-qp 0`**: Sets the quality of the output video. A value of 0 means lossless compression.
- **`output.mp4`**: The name of the output file.

Make sure you have the necessary permissions to capture the screen, and ffmpeg is installed on your system. Adjust the command according to your specific needs, such as setting the resolution or the frame rate.

To record the desktop video using ffmpeg and save it as an .ogv file, you can use the following command:

```bash
ffmpeg -f x11grab -i :0.0 -codec:v libtheora -qscale:v 7 output.ogv
```

Explanation:

- **`-codec:v libtheora`**: This specifies the video codec to use for encoding the video, in this case, libtheora for OGV format.
- **`-qscale:v 7`**: This sets the video quality scale for the Theora codec (scale is from 0 to 10, where 10 is the highest quality).
- **`output.ogv`**: This is the name of the output file.
