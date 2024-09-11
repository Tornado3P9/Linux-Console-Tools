# ExifTool

Exiftool is a platform-independent Perl library plus a command-line application for reading, writing, and editing meta information in a wide variety of files. Exiftool supports many different metadata formats including EXIF, GPS, IPTC, XMP, JFIF, GeoTIFF, ICC Profile, Photoshop IRB, FlashPix, AFCP, and ID3, as well as the maker notes of many digital cameras.  
More information: <https://exiftool.org>.

```bash
sudo apt install libimage-exiftool-perl
```

Examples:  
```bash
# Print the EXIF metadata for a given file:
exiftool path/to/file

# Remove all EXIF metadata from the given files:
exiftool -All= path/to/file1 path/to/file2 ...

# Remove GPS EXIF metadata from given image files:
exiftool "-gps*=" path/to/image1 path/to/image2 ...

# Remove all EXIF metadata from the given image files, then re-add metadata for color and orientation:
exiftool -All= -tagsfromfile @ -colorspacetags -orientation path/to/image1 path/to/image2 ...

# Move the date at which all photos in a directory were taken 1 hour forward:
exiftool "-AllDates+=0:0:0 1:0:0" path/to/directory

# Move the date at which all JPEG photos in the current directory were taken 1 day and 2 hours backward:
exiftool "-AllDates-=0:0:1 2:0:0" -ext jpg

# Only change the `DateTimeOriginal` field subtracting 1.5 hours, without keeping backups:
exiftool -DateTimeOriginal-=1.5 -overwrite_original

# Recursively rename all JPEG photos in a directory based on the `DateTimeOriginal` field:
exiftool '-filename<DateTimeOriginal' -d %Y-%m-%d_%H-%M-%S%%lc.%%e path/to/directory -r -ext jpg

# Example of an output:
exiftool -a -g1 IMG_0524.jpeg > exiftool.txt

---- ExifTool ----
ExifTool Version Number         : 8.60
---- System ----
File Name                       : IMG_0524.jpeg
Directory                       : .
File Size                       : 106 kB
File Modification Date/Time     : 2016:01:08 16:28:52+01:00
File Permissions                : rw-rw-r--
---- File ----
File Type                       : JPEG
MIME Type                       : image/jpeg
Current IPTC Digest             : d41d8cd98f00b204e9800998ecf8427e
Image Width                     : 480
Image Height                    : 640
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
---- JFIF ----
JFIF Version                    : 1.01
Resolution Unit                 : inches
X Resolution                    : 72
Y Resolution                    : 72
---- Photoshop ----
IPTC Digest                     : d41d8cd98f00b204e9800998ecf8427e
---- ICC-header ----
Profile CMM Type                : Lino
Profile Version                 : 2.1.0
Profile Class                   : Display Device Profile
Color Space Data                : RGB
Profile Connection Space        : XYZ
Profile Date Time               : 1998:02:09 06:49:00
Profile File Signature          : acsp
Primary Platform                : Microsoft Corporation
CMM Flags                       : Not Embedded, Independent
Device Manufacturer             : IEC
Device Model                    : sRGB
Device Attributes               : Reflective, Glossy, Positive, Color
Rendering Intent                : Perceptual
Connection Space Illuminant     : 0.9642 1 0.82491
Profile Creator                 : HP
Profile ID                      : 0
---- ICC_Profile ----
Profile Copyright               : Copyright (c) 1998 Hewlett-Packard Company
Profile Description             : sRGB IEC61966-2.1
Media White Point               : 0.95045 1 1.08905
Media Black Point               : 0 0 0
Red Matrix Column               : 0.43607 0.22249 0.01392
Green Matrix Column             : 0.38515 0.71687 0.09708
Blue Matrix Column              : 0.14307 0.06061 0.7141
Device Mfg Desc                 : IEC http://www.iec.ch
Device Model Desc               : IEC 61966-2.1 Default RGB colour space - sRGB
Viewing Cond Desc               : Reference Viewing Condition in IEC61966-2.1
Luminance                       : 76.03647 80 87.12462
Technology                      : Cathode Ray Tube Display
Red Tone Reproduction Curve     : (Binary data 2060 bytes, use -b option to extract)
Green Tone Reproduction Curve   : (Binary data 2060 bytes, use -b option to extract)
Blue Tone Reproduction Curve    : (Binary data 2060 bytes, use -b option to extract)
---- ICC-view ----
Viewing Cond Illuminant         : 19.6445 20.3718 16.8089
Viewing Cond Surround           : 3.92889 4.07439 3.36179
Viewing Cond Illuminant Type    : D50
---- ICC-meas ----
Measurement Observer            : CIE 1931
Measurement Backing             : 0 0 0
Measurement Geometry            : Unknown (0)
Measurement Flare               : 0.999%
Measurement Illuminant          : D65
---- Composite ----
Image Size                      : 480x640
```
