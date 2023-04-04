#!/bin/bash

# Set the path for the whisper folder
whisper_folder="${XDG_DATA_HOME:-$HOME/.local/share}/whisper"
bin_folder="$HOME/.local/bin"

if [ ! -d "$bin_folder" ]; then
	mkdir -p "$bin_folder"
fi

# Check if the whisper folder exists, and create it if it doesn't
if [ ! -d "$whisper_folder" ]; then
  mkdir -p "$whisper_folder"
fi

# Check if the whisper.cpp repository has already been cloned
if [ ! -d "whisper.cpp" ]; then
  # Clone the repository without git information
  git clone --depth=1 --branch=master https://github.com/ggerganov/whisper.cpp.git whisper.cpp
  rm -rf whisper.cpp/.git
fi

# Move into the whisper.cpp directory and run make
cd whisper.cpp
make

# Download the ggml model
bash models/download-ggml-model.sh base.en

# Copy the downloaded model to the whisper folder
cp models/ggml-base.en.bin "$whisper_folder"
cp main "$bin_folder/whisper_exec"
cp ../transcribe $bin_folder/transcribe

rm -rf whisper.cpp
