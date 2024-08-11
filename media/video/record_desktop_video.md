## .mp4

To record the desktop video without audio using ffmpeg, you can use the x11grab input device, which allows you to capture the content of your X11 screen. Here's a basic command to record the desktop video:

```bash
ffmpeg -f x11grab -r 30 -i :0.0 -vcodec libx264 -preset ultrafast -qp 0 output.mp4

ffmpeg -f x11grab -r 30 -s $(xdpyinfo | grep 'dimensions:'| awk '{print $2}') -i :0.0 -vcodec libx264 -preset ultrafast -crf 18 -pix_fmt yuv420p output.mp4
```

Explanation of the options:

- **`-f x11grab`**: Specifies the input format to be X11 screen capture.
- **`-r 30`**: This sets the frame rate to 30 fps.
- **`-s $(xdpyinfo | grep 'dimensions:'| awk '{print $2}')`**: This sets the video size to your current screen resolution. xdpyinfo gets screen information, grep filters out the line with dimensions, and awk prints out the resolution.
- **`-i :0.0`**: Defines the input source, where :0.0 is the display and screen number of your X11 session (default for the first display and screen).
- **`-vcodec libx264`**: Sets the video codec to libx264 for H.264 encoding.
- **`-preset ultrafast`**: Uses the ultrafast preset for minimal compression to achieve a faster encoding speed, which is useful for capturing video in real-time.
- **`output.mp4`**: The name of the output file.

When using ffmpeg for video recording, the options **`-qp`** and **`-crf`** are related to video quality settings, but they work differently:

- **`-qp 0`**: This option sets the Quantization Parameter to 0, which effectively means lossless compression for most codecs that support this parameter. When you set -qp 0, you're telling ffmpeg to encode the video with the highest possible quality, with no loss due to compression.
- **`-crf 18`**: The Constant Rate Factor (CRF) is a quality-controlled variable bitrate setting. CRF values can range from 0 to 51, with lower values resulting in better quality and higher file sizes. A value of 18 is generally considered to be visually "near lossless", but not mathematically lossless. It's a good balance between quality and file size.
- **`-pix_fmt yuv420p`**: This option specifies the pixel format to use. yuv420p is a widely compatible pixel format that uses chroma subsampling, making it a good choice for compatibility and reasonable file sizes. It's the standard format for many video services and devices.

In summary, -qp 0 will give you lossless video, which is the highest quality and largest file size, while -crf 18 -pix_fmt yuv420p will give you a high-quality video that is not lossless but is more compressed, with a smaller file size and good compatibility.

## .ogv

```bash
ffmpeg -f x11grab -r 30 -i :0.0 -codec:v libtheora -qscale:v 7 output.ogv
```

Explanation:

- **`-codec:v libtheora`**: This specifies the video codec to use for encoding the video, in this case, libtheora for OGV format.
- **`-qscale:v 7`**: This sets the video quality scale for the Theora codec (scale is from 0 to 10, where 10 is the highest quality).
- **`output.ogv`**: This is the name of the output file.
