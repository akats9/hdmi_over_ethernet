#!/bin/bash

# CLIENT SIDE

echo "Enter the IP address of the server:\n"
read server_IP

echo "Enter port number of server:\n"
read server_Port

# Receive the video stream and pipe it to ffplay for decoding and display
nc "$server_IP" $server_Port | ffmpeg -i - -vf "fps=24" -f sdl "Screen Stream"
