## ghostscript - reduce pdf file size

https://www.digitalocean.com/community/tutorials/reduce-pdf-file-size-in-linux

```bash
sudo apt install ghostscript

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
```