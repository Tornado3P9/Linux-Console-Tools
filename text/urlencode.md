## urlencode

https://stackoverflow.com/questions/11876353/url-encoding-a-string-in-bash-script

```bash
echo "https://youtu.be/1244,.#( test" > any.txt

cat any.txt | python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.stdin.read()))"
# https%3A//youtu.be/1244%2C.%23%28%20test%0A
```
