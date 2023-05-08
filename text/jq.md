## jq - commandline JSON processor

https://itsfoss.com/pretty-print-json-linux/  
https://stedolan.github.io/jq/manual/  

Usage: `jq [options] <jq filter> [file...]`  

Some of the options include:  
-c              compact instead of pretty-printed output;  
-n              use `null` as the single input value;  
-e              set the exit status code based on the output;  
-s              read (slurp) all inputs into an array; apply filter to it;  
-r              output raw strings, not JSON texts;  
-R              read raw strings, not JSON texts;  
-C              colorize JSON;  
-M              monochrome (don't colorize JSON);  
-S              sort keys of objects on output;  
--tab            use tabs for indentation;  
--arg a v        set variable $a to value <v>;  
--argjson a v    set variable $a to JSON value <v>;  
--slurpfile a f  set variable $a to an array of JSON texts read from <f>;  
--rawfile a f    set variable $a to a string consisting of the contents of <f>;  
--args           remaining arguments are string arguments, not files;  
--jsonargs       remaining arguments are JSON arguments, not files;  
--               terminates argument processing;  

Named arguments are also available as $ARGS.named[], while  
positional arguments are available as $ARGS.positional[].  

```bash
# Execute a specific expression:
cat file.json | jq '.'                  # print a colored and formatted JSON
echo '{"foo": 0}' | jq . > pretty.json  # print a colored and formatted JSON and write to file
jq -c < pretty.json                     # print a minified JSON output
jq -c < pretty.json > short.json        # create a minified JSON file

# Execute a specific script:
cat path/to/file.json | jq --from-file path/to/script.jq

# Pass specific arguments:
cat path/to/file.json | jq --arg "name1" "value1" --arg "name2" "value2" ... '. + $ARGS.named'

# Print specific keys:
cat path/to/file.json | jq '.key1, .key2, ...'

# Print specific array items:
cat path/to/file.json | jq '.[index1], .[index2], ...'

# Print all array items/object keys:
cat path/to/file.json | jq '.[]'

# Add/remove specific keys:
cat path/to/file.json | jq '. +|- {"key1": "value1", "key2": "value2", ...}'

# Using Python to pretty print JSON file in Linux
python3 -m json.tool path/to/file.json
```

