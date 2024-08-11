# Record desktop audio

## parec + oggenc

To record only the desktop audio as an OGG file on a Linux system, you can use a
command-line tool like **`parec`** (PulseAudio Record) along with **`oggenc`** to encode the audio to the OGG format. Here's how you can do it:

1. Open a terminal.
2. Use the following command to record the desktop audio:

```bash
parec --format=s16le --rate=44100 --channels=2 | oggenc - -r -o output.ogg
```

This command will start recording the desktop audio and encode it in real-time
to an OGG file named **`output.ogg`**. The **`--format=s16le`** specifies the sample format, **`--rate=44100`** sets the sample rate, and **`--channels=2`** sets it to stereo. The **`oggenc`** command takes the raw audio from **`parec`** and encodes it to OGG format.

To stop the recording, simply press **`Ctrl+C`** in the terminal.

Make sure you have **`pulseaudio-utils`** and **`vorbis-tools`** installed to have **`parec`** and **`oggenc`** available. You can install them using the following command:

```bash
sudo apt-get install pulseaudio-utils vorbis-tools
```

Please note that the exact command may vary depending on your system's
configuration and the specific audio source you want to record. Use **`pactl list sources`** to list available audio sources and adjust the **`parec`** command accordingly
to target the correct source.

## ffmpeg

To record only the desktop audio and save it as an OGG file using **`ffmpeg`**, you can use the following command:

```bash
ffmpeg -f pulse -i default -c:a libvorbis output.ogg
```

Here's what each part of the command does:

- **`-f pulse`**: Specifies the input format to use PulseAudio (which is commonly used on Ubuntu systems).
- **`-i default`**: Selects the default audio input source, which usually corresponds to the system's audio output (desktop audio).
- **`-c:a libvorbis`**: Specifies the audio codec to use for encoding the audio, in this case, libvorbis for OGG.

## audacity

advanced tool with graphical user interface

```bash
sudo apt install audacity
```
