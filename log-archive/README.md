# Log Archive Tool (Bash)

Project Roadmap URL: [https://roadmap.sh/projects/log-archive-tool](https://roadmap.sh/projects/log-archive-tool)  
Project GitHub URL: [https://github.com/ismail-en-niou/log-archive-tool](https://github.com/ismail-en-niou/log-archive-tool)

## Description

A simple Bash CLI tool to archive logs from a specified directory by compressing them into a `.tar.gz` file and storing them in a new directory. The tool also logs the date and time of each archive operation for easy tracking.

This helps maintain a clean system by removing old logs and storing them in a compressed format for future reference.

## Features

- Accepts the log directory as a command-line argument
- Compresses logs into a timestamped `.tar.gz` archive
- Stores archives in a dedicated `archived_logs` directory
- Logs the date and time of each archive operation in `archive_log.txt`

## Usage

```bash
chmod +x log-archive.sh
./log-archive.sh <log-directory>
```

For example, to archive logs from `/var/log`:

```bash
./log-archive.sh /var/log
```

- The compressed archive will be stored in the `archived_logs` directory, with a name like `logs_archive_20240816_100648.tar.gz`.
- Each archive operation is logged in `archive_log.txt`.

## Requirements

- Bash shell (Linux, macOS, or WSL)
- `tar` utility (standard on Unix systems)

## Advanced Ideas

Feel free to extend this tool with features such as:
- Emailing notifications upon successful archive
- Uploading archives to a remote server or cloud storage
- Scheduling automated archiving (e.g., via cron jobs)

## License

MIT License


### Submission Instructions

- Submit the URL of your GitHub repository with the solution.
- URL must point to a public GitHub repository.
- Repository must contain a README file.
- README file must contain the project URL.
-[text](https://roadmap.sh/projects/log-archive-tool)