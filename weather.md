## Inxi

```bash
sudo apt install inxi
```

Inxi is a command-line application that can show detailed software and hardware information about your system in a terminal. It can also show weather information based on your current timezone if you use the “-w” command-line switch.
```bash
inxi -w
inxi -W Mumbai, India
inxi -W Berlin,Germany
inxi -W Hamburg,Germany
inxi -W Koeln,Germany
```

## Wttr.in
Wttr.in is a website and command-line application that can show current and future weather forecasts in a terminal. To access weather information using Wttr.in, you need to install the “Curl” command line downloader.
You can install Curl in Ubuntu by using the following command:

```bash
sudo apt install curl
```

Curl can be installed in other Linux distributions from the package manager shipped with the OS.

Once Curl is installed, run the following command to view weather information for your current location:
```bash
curl wttr.in
```
You can also supply a custom location using a command in the following format:
```bash
curl wttr.in/Mumbai
curl wttr.in/Berlin
curl wttr.in/Hamburg
curl wttr.in/Koeln
curl wttr.in/Taipei
```
