#!/bin/bash
set -e

# Install script for SFML dependencies in Docker
# This script installs all required dependencies for building SFML
# Compatible with Debian/Ubuntu-based Docker images

echo "Installing SFML build dependencies..."

# Update package lists
sudo apt-get update

# Install basic build tools
sudo apt-get install -y \
    build-essential \
    cmake \
    git \
    pkg-config

# Install X11 and windowing system dependencies (for Window module)
sudo apt-get install -y \
    libx11-dev \
    libxrandr-dev \
    libxcursor-dev \
    libxi-dev \
    libudev-dev

# Install OpenGL dependencies (for Graphics module)
sudo apt-get install -y \
    libgl1-mesa-dev \
    libglu1-mesa-dev

# Install FreeType and HarfBuzz dependencies (for Graphics/text rendering)
sudo apt-get install -y \
    libfreetype6-dev \
    libharfbuzz-dev

# Install audio codec dependencies (for Audio module)
sudo apt-get install -y \
    libvorbis-dev \
    libflac-dev \
    libogg-dev \
    libopenal-dev

# Clean up to reduce image size
sudo apt-get clean
rm -rf /var/lib/apt/lists/*

echo "All dependencies installed successfully!"
echo "You can now run: cmake -S . -B build"
