# 🚀 spiko

```text

             _  _
 ___  _ __  (_)| | __  ___
/ __|| '_ \ | || |/ / / _ \
\__ \| |_) || ||   < | (_) |
|___/| .__/ |_||_|\_\ \___/
     |_|
```

Spiko is a fast, lightweight load testing tool built with Rust and powered by Tokio. It offers a clean and interactive TUI (Text User Interface) to provide real-time insights into your web application’s performance. Inspired by `trinhminhtriet/blast`, Spiko helps you simulate load and monitor the results in an intuitive and easy-to-understand interface.

![Spiko](docs/images/demo.gif)

## ✨ Features

- 🚀 High-performance load testing with minimal overhead
- 🎨 Real-time TUI with beautiful, interactive graphs
- ⚡ Powered by Rust and Tokio for fast, reliable results
- 🧑‍💻 Simple configuration with easy-to-understand commands
- 📊 Visual feedback on request rates, latency, and more

## 🚀 Installation

To install **spiko**, simply clone the repository and follow the instructions below:

```bash
git clone git@github.com:trinhminhtriet/spiko.git
cd spiko

cargo build --release
cp ./target/release/spiko /usr/local/bin/
spiko --version
spiko --help
spiko -n 1000 https://github.com
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

```
Usage: spiko [OPTIONS] <URL>

Arguments:
  <URL>  Target URL.

Options:
  -n <N_REQUESTS>
          Number of requests to run. [default: 200]
  -c <N_CONNECTIONS>
          Number of connections to run concurrently. You may should increase limit to number of open files for larger `-c`. [default: 50]
  -p <N_HTTP2_PARALLEL>
          Number of parallel requests to send on HTTP/2. `spiko` will run c * p concurrent workers in total. [default: 1]
  -z <DURATION>
          Duration of application to send requests. If duration is specified, n is ignored.
          On HTTP/1, When the duration is reached, ongoing requests are aborted and counted as "aborted due to deadline"
          You can change this behavior with `-w` option.
          Currently, on HTTP/2, When the duration is reached, ongoing requests are waited. `-w` option is ignored.
          Examples: -z 10s -z 3m.
  -w, --wait-ongoing-requests-after-deadline
          When the duration is reached, ongoing requests are waited
  -q <QUERY_PER_SECOND>
          Rate limit for all, in queries per second (QPS)
      --burst-delay <BURST_DURATION>
          Introduce delay between a predefined number of requests.
          Note: If qps is specified, burst will be ignored
      --burst-rate <BURST_REQUESTS>
          Rates of requests for burst. Default is 1
          Note: If qps is specified, burst will be ignored
      --rand-regex-url
          Generate URL by rand_regex crate but dot is disabled for each query e.g. http://127.0.0.1/[a-z][a-z][0-9]. Currently dynamic scheme, host and port with keep-alive are not works well. See https://docs.rs/rand_regex/latest/rand_regex/struct.Regex.html for details of syntax.
      --max-repeat <MAX_REPEAT>
          A parameter for the '--rand-regex-url'. The max_repeat parameter gives the maximum extra repeat counts the x*, x+ and x{n,} operators will become. [default: 4]
      --dump-urls <DUMP_URLS>
          Dump target Urls <DUMP_URLS> times to debug --rand-regex-url
      --latency-correction
          Correct latency to avoid coordinated omission problem. It's ignored if -q is not set.
      --no-tui
          No realtime tui
  -j, --json
          Print results as JSON
      --fps <FPS>
          Frame per second for tui. [default: 16]
  -m, --method <METHOD>
          HTTP method [default: GET]
  -H <HEADERS>
          Custom HTTP header. Examples: -H "foo: bar"
  -t <TIMEOUT>
          Timeout for each request. Default to infinite.
  -A <ACCEPT_HEADER>
          HTTP Accept Header.
  -d <BODY_STRING>
          HTTP request body.
  -D <BODY_PATH>
          HTTP request body from file.
  -T <CONTENT_TYPE>
          Content-Type.
  -a <BASIC_AUTH>
          Basic authentication, username:password
      --http-version <HTTP_VERSION>
          HTTP version. Available values 0.9, 1.0, 1.1.
      --http2
          Use HTTP/2. Shorthand for --http-version=2
      --host <HOST>
          HTTP Host header
      --disable-compression
          Disable compression.
  -r, --redirect <REDIRECT>
          Limit for number of Redirect. Set 0 for no redirection. Redirection isn't supported for HTTP/2. [default: 10]
      --disable-keepalive
          Disable keep-alive, prevents re-use of TCP connections between different HTTP requests. This isn't supported for HTTP/2.
      --no-pre-lookup
          *Not* perform a DNS lookup at beginning to cache it
      --ipv6
          Lookup only ipv6.
      --ipv4
          Lookup only ipv4.
      --insecure
          Accept invalid certs.
      --connect-to <CONNECT_TO>
          Override DNS resolution and default port numbers with strings like 'example.org:443:localhost:8443'
      --disable-color
          Disable the color scheme.
      --unix-socket <UNIX_SOCKET>
          Connect to a unix socket instead of the domain in the URL. Only for non-HTTPS URLs.
      --stats-success-breakdown
          Include a response status code successful or not successful breakdown for the time histogram and distribution statistics
      --db-url <DB_URL>
          Write succeeded requests to sqlite database url E.G test.db
      --debug
          Perform a single request and dump the request and response
  -h, --help
          Print help
  -V, --version
          Print version
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

## 🙏 Acknowledgements

- [hatoo/oha](https://github.com/hatoo/oha)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
