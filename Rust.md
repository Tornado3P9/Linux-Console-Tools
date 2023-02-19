## Rust

https://www.rust-lang.org/tools/install  
https://doc.rust-lang.org/book/  
https://crates.io/  

```bash
cargo new project_name
cd project_name/

cargo add linfa-trees # add the crate 'linfa-trees' to the Cargo.toml file

cargo fmt             # format code, just like the rustfmt command
cargo clippy          # fix better style, correctness, complexity

cargo check           # verify source code and simulate compilation, but don't create final binary
cargo run             # compile and execute

rustup doc            # open official documentation
cargo doc --open      # create custom documentation from your dependencies
cargo doc --no-deps --open # create custom documentation without all the extern dependencies

cargo build           # only compile binary, don't execute
cargo build --release # only compile binary, but try optimizing the final build
```
