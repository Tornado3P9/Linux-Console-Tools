Install  
https://www.rust-lang.org/tools/install  

```bash
cargo new project_name
cd project_name/

cargo run             # compile and execute directly

cargo check           # verify source code and simulate compilation, but don't create final binar

rustup doc            # open official documentation
cargo doc --open      # create custom documentation from your dependencies

cargo build           # only compile binary, don't execute
cargo build --release # only compile binary, but try optimizing the final build
```
