## Rust

https://www.rust-lang.org/tools/install  
https://doc.rust-lang.org/rust-by-example/index.html  
https://doc.rust-lang.org/book/  
https://learning-rust.github.io/docs/cargo-crates-and-basic-project-structure/  
https://play.rust-lang.org/  
https://crates.io/  
https://blog.logrocket.com/guide-cross-compilation-rust/  
https://github.com/cross-rs/cross  

start new project
```bash
# version a
cargo new project_name
cd project_name/

# version b
mkdir project_name
cd project_name/
cargo init
```

most used commands
```bash
cargo add some_crate  # add a crate to the Cargo.toml file

cargo install cargo-generate  # add the developer tool to help you get up and running quickly with a new Rust project by leveraging a pre-existing git repository as a template
cargo generate --git https://github.com/slint-ui/slint-rust-template --name my-project

cargo fmt              # format code, just like the rustfmt command
cargo clippy           # fix better style, correctness, complexity

cargo check            # verify source code and simulate compilation, but don't create final binary
cargo run              # compile and execute

rustup doc             # open official documentation
cargo doc --open       # create custom documentation from your dependencies
cargo doc --no-deps --open  # create custom documentation without all the extern dependencies

cargo build            # only compile binary, don't execute
cargo build --release  # only compile binary, but try optimizing the final build

strip target/release/my_program  # Discard symbols from executables or object files and thus reducing the final size.
```

other commands
```bash
cargo update           # Update project dependencies
cargo test             # Run tests
cargo bench            # Run benchmarks, run `rustup default nightly` to use this feature and return to stable with `rustup default stable`
cargo clean            # Deletes the target directory. Somethimes using clean does resolve some issues.
cargo build --verbose  # If there are issues, the --verbose option might give helpful information.
```

reinstall cargo if problem
```bash
rustup update          # update rust just in case
rustup component remove cargo
rustup component add cargo
cargo --version
```

visualize crates module tree https://crates.io/crates/cargo-modules
```bash
cargo install cargo-modules

cargo modules generate tree --with-types
```

cross-compile to other operating systems
```bash
sudo apt-get install podman

cargo install cross

rustup target add x86_64-pc-windows-gnu
rustup target add x86_64-apple-darwin

cross build --release --target x86_64-pc-windows-gnu
cross build --release --target x86_64-apple-darwin
```
