#!/bin/bash
find /usr/share/doc -name "copyright"


cat <<EOF


#Example:
#cat /usr/share/doc/hello-world/copyright

hello-world

Copyright: Max Mustermann <max.mustermann@gmail.com>

2022-01-01

The home page of hello-world is at: 
https://www.hello-world.de/

The entire code base may be distributed under the terms of the GNU General
Public License (GPL), which appears immediately below.  Alternatively, all
of the source code as any code derived from that code may instead be
distributed under the GNU Lesser General Public License (LGPL), at the
choice of the distributor. The complete text of the LGPL appears at the
bottom of this file.

See /usr/share/common-licenses/(GPL|LGPL)


#Example:

Copyright 2022 hello-world GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

EOF
