# img2pdf

Losslessly convert raster images to a PDF file.  
Some supported image formats are: GIF, JPEG, JPEG2000, PNG, GIF and TIFF.  
More information: <https://gitlab.mister-muffin.de/josch/img2pdf>.  
```bash
# Convert one or more images to a single PDF, each image being on its own page:
img2pdf image1.png image2.png --output output.pdf
img2pdf *.jpeg -o output.pdf

# Convert only the first frame of a multi-frame image to PDF:
img2pdf file.gif --first-frame-only --output output.pdf

# Auto orient the image, use a specific page size in landscape mode, and set a border of specific sizes horizontally and vertically:
img2pdf image.png --auto-orient --pagesize A4^T --border 2cm:5.1cm --output output.pdf

# Shrink only larger images to a rectangle of specified dimensions inside a page with a specific size:
img2pdf image.png --pagesize 30cmx20cm --imgsize 10cmx15cm --fit shrink --output output.pdf

# Convert an image to PDF, and specify metadata for the resulting file:
img2pdf image.png --title title --author author --creationdate 1970-01-31 --keywords keyword1 keyword2 --subject subject --output output.pdf
```
