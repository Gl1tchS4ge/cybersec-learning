# Python Port Scanner

A simple multithreaded port scanner built in Python using sockets.

## Description

This project scans a target host for open TCP ports.
It supports scanning common ports or a custom range of ports defined by the user.

The scanner uses multithreading to improve performance and reduce scan time.

## Features

* Scan common ports (21, 22, 80, 443, 8080)
* Scan custom port ranges
* Multithreaded scanning for faster results
* Timeout handling for better performance
* Clean and simple CLI interface

## Usage

1. Clone the repository:

```
git clone https://github.com/your-username/your-repo-name.git
```

2. Run the script:

```
python port_scanner.py
```

3. Enter:

* Target address (domain or IP)
* Scan type (common ports or custom range)
* Port range (if applicable)

##  What I Learned

* Working with Python sockets
* Handling network connections
* Writing reusable functions
* Implementing multithreading
* Managing threads safely with `.join()`

## Disclaimer

This tool is for educational purposes only.

Only scan systems you own or have explicit permission to test. Unauthorized scanning may be illegal.

## Project Structure

```
port_scanner.py
README.md
```
