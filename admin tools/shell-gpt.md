## shell-gpt

Command-line productivity tool powered by OpenAI's GPT models.  
More information: https://github.com/TheR1D/shell_gpt#readme.  

Installation:
```bash
pip3 install shell-gpt

# go to platform.openai.com/signup and get a valid api-key
# then
export OPENAI_API_KEY=exampleapikeyexampleapikeyexampleapikey

# check
env | grep -i openai

# if it works you might want to make it permanent like so
echo 'export OPENAI_API_KEY=exampleapikeyexampleapikeyexampleapikey' >> ~/.bashrc
source ~/.bashrc

# or like so
cat <<EOF >>~/.config/shell_gpt/.sgptrc
OPENAI_API_KEY=exampleapikeyexampleapikeyexampleapikey
OPENAI_API_HOST=https://api.openai.com
CHAT_CACHE_LENGTH=100
CHAT_CACHE_PATH=/tmp/shell_gpt/chat_cache
CACHE_LENGTH=100
CACHE_PATH=/tmp/shell_gpt/cache
REQUEST_TIMEOUT=60
EOF
```

Examples:
```bash
# Use it as a search engine, asking for the mass of the sun:
sgpt "mass of the sun"
sgpt "make a short and concise summary of the ss command"

# Execute Shell commands, and apply `chmod 444` to all files in the current directory:
sgpt --shell "make all files in current directory read only"
sgpt -s "make all files in current directory read only"

# Actually execute the command
sgpt -s -e "install firefox"

# Generate code:
sgpt --code "solve fizz buzz problem using Rust"
sgpt "command to print 'pc or npc' to the terminal. Answer with the command only"

# Start a chat session with a unique session name:
sgpt --chat session_name "please remember my favorite number: 4"

# Start a `REPL` (Read–eval–print loop) session:
sgpt --repl command

# Display help:
sgpt --help
```
