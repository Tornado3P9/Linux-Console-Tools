## inxi

```bash
# inxi – System- und Hardware-Informationen am Terminal unter Linux anzeigen
inxi -Fxzd

# Mit der Option “-vN” wobei das “N” einer Zahl zwischen 1 und 7 entspricht zeigt die Software entsprechend mehr Informationen an:
inxi -v7

# Etwas weniger Infos, dafür aber übersichtlicher erhält man Informationen aller Art mit den Optionen “-Fz“:
inxi -Fz

# Nicht jeder Nutzer ist mit der Farbe blau zufrieden, mit der Option “-cN” kann man die Farb-Ausgabe anpassen wobei “N” einer Zahl zwischen 0 und 42 entsprechen kann,
# so wandelt sich mit der 12 die Ausgabe in rot – der selbe Befehl wie oben:
inxi -Fz -c12

# Options:
# -A	Audio-Hardware und Treiber
# -b	Erweiterte Basis-Informationen
# -B	Informationen zum Akku oder den Akkus
# -C	Informationen zur CPU
# -f	Fähigkeiten der CPU (Flags)
# -d	Informationen zu den Laufwerken, auch optische
# -D	Informationen über interne Laufwerke
# -F	Basis-Informationen rund um System und Hardware
# -G	Informationen zur Grafik-Hardware und Treiber
# -i	Infos zum Netzwerk, IP-Adresse, WAN, MAC-Adresse, Hardware, …
# -I	Informationen zur Laufzeit des Systems
# -l	Informationen zu den Partitionen
# -m	Hauptspeicher (RAM) und Hardware, als Administrator ausgeführt erweiterte Infos
# -M	Informationen zu Marke und Modell, erweiterte Infos als Administrator
# -N	Informationen zur Netzwerk-Hardware und Treiber
# -n	Wie “-N” jedoch erweiterte Infos
# -o	Infos zu nicht eingehängten Partitionen
# -P und -p	Infos und erweiterte Infos zu den Partitionen
# -R	Informationen zum Raid-System
# -s	Hiermit erhalten Sie Sensor-Informationen, Temperatur, Lüfter-Umdrehungen
# -S	Angaben zum Betriebssystem
# –usb	Infos zur USB-Hardware
```

## Print Linux Distro:
```bash
cat /etc/issue
cat /etc/os-release
lsb_release -d
lsb_release -cs
hostnamectl
```
