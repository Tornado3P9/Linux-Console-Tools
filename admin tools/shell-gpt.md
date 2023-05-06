## shell-gpt

Command-line productivity tool powered by OpenAI's GPT models.  
More information: https://github.com/TheR1D/shell_gpt#readme.  

Installation:
```bash
pip3 install shell-gpt

# go to platform.openai.com/signup and get a valid api-key
# then
export OPENAI_API_KEY=exampleapikeyexampleapikeyexampleapikey

# verify
env | grep -i openai

# if it works you might want to make it permanent like so
echo 'export OPENAI_API_KEY=exampleapikeyexampleapikeyexampleapikey' >> ~/.bashrc
source ~/.bashrc

# or like so `nano ~/.config/shell_gpt/.sgptrc`
OPENAI_API_KEY=exampleapikeyexampleapikeyexampleapikey
OPENAI_API_HOST=https://api.openai.com
CHAT_CACHE_LENGTH=100
CHAT_CACHE_PATH=/tmp/shell_gpt/chat_cache
CACHE_LENGTH=100
CACHE_PATH=/tmp/shell_gpt/cache
REQUEST_TIMEOUT=60
DEFAULT_MODEL=gpt-3.5-turbo
DEFAULT_COLOR=magenta
SYSTEM_ROLES=false
```
https://github.com/TheR1D/shell_gpt#runtime-configuration-file  

Examples:
```bash
# Use it as a search engine:
sgpt "mass of the sun"
sgpt "make a short and concise summary of the ss command"

# Execute Shell commands:
sgpt -shell "install firefox"
sgpt -s "show all open ports"

# Generate code:
sgpt --code "solve fizz buzz problem using Rust"
sgpt "command to print 'pc or npc' to the terminal. Answer with the command only"

# Start a chat session with a unique session name:
sgpt --chat session_name "please remember my favorite number: 4"

# Start a `REPL` (Read–eval–print loop) session:
sgpt --repl command

# Display help:
sgpt --help
tldr sgpt
```
