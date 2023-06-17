## Making one video out of three
To concatenate three videos of the same solution and framerate to another and create a single longer video using ffmpeg, you can use the following command:

```bash
ffmpeg -i "concat:video1.mp4|video2.mp4|video3.mp4" -c copy output.mp4
```
Replace "video1.mp4", "video2.mp4", and "video3.mp4" with the names of your input videos, and "output.mp4" with the name you want to give to your output video.
This command will concatenate the three input videos into a single output video without re-encoding the video and audio streams,
which will preserve the quality of the original videos.
