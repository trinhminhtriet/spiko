# 🧹 spiko

```text

{{art_text}}

```

🧹 spiko is...

## ✨ Features

TBD

## 🚀 Installation

To install **spiko**, simply clone the repository and follow the instructions below:

```bash
git clone git@github.com:trinhminhtriet/spiko.git
cd spiko

cargo build --release
cp ./target/release/spiko /usr/local/bin/
```

Running the below command will globally install the `spiko` binary.

```bash
cargo install spiko
```

Optionally, you can add `~/.cargo/bin` to your PATH if it's not already there

```bash
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 💡 Usage

Run **spiko** with the following command to start cleaning your filesystem:

```sh
./spiko [options] [path]

```

## 🗑️ Uninstallation

Running the below command will globally uninstall the `spiko` binary.

```bash
cargo uninstall spiko
```

Remove the project repo

```bash
rm -rf /path/to/git/clone/spiko
```

## 🤝 How to contribute

We welcome contributions!

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m "feat: my new feature"`;
- Push to your branch: `git push origin my-feature`.

Once your pull request has been merged, you can delete your branch.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
