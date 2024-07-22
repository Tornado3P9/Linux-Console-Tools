# Linux Console Tools
If command unknown (apt, dpkg, ...)  
1. Simple Help:
   ```
   dpkg --help
   ```

2. Install tldr (too long, didn't read) helper tool
   ```bash
   git clone https://github.com/tldr-pages/tldr-c-client.git
   cd tldr-c-client

   sudo ./deps.sh      # install dependencies
   make                # build tldr
   sudo make install   # install tldr

   tldr ls             # run tldr and explain with examples how the command 'ls' works
   ```

3. Using the Manual Page:
   ```
   man dpkg
   ```
   `man` uses the text program `less` to show it's content. Therefore you can use the same commands and shortcuts.

4. Search Engines:
   - `ubuntuusers wiki dpkg` -> dann klick auf das, wo *Wiki* und *ubuntuusers.de* im Namen vorkommt
   - `tecmint dpkg` -> www.tecmint.com
   - https://explainshell.com/
   - https://ss64.com/bash/
   - https://ss64.com/bash/syntax.html
   - https://devhints.io/bash

5. Read other Github posts:
   - https://github.com/jlevy/the-art-of-command-line/blob/master/README.md

6. Watch Linux Tutorials:
   - [Linux Administration: The Complete Linux Bootcamp 2024](https://www.udemy.com/course/master-linux-administration/) from Andrei Dumitrescu

7. Call Linux Support:
   - Deutscher Linux Support auf https://www.linuxguides.de/linux-support/
   - https://ubuntu.com/community/support
   - https://www.amd.com/en/support/download/drivers.html
   - https://www.redhat.com/en/services/support