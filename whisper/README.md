# Whisper.cpp to transcribe calls

This project installs a `transcribe` script that uses whisper to quickly go from text to speech.

# Requirements

This has only been tested in MacOs

* Add `$HOME/.local/bin` to your path
* Install `ffmpeg`, `awk`, `sed`

# Usage

If the path has been properly configured you can run `transcribe <path-to-audio> [<tag for filename>, optional]`.
