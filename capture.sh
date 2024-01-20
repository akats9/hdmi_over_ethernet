#!/bin/bash

# SERVER SIDE

echo "Enter port to run the server:\n"
read port

while true; do
    # Capture the screen and pipe the image data to ffmpeg for encoding
    scrot -q 100 -d 0.42 - | ffmpeg -f image2pipe -vcodec png -r 24 -i - -f mpegts - | \
        # Stream the video to a network address
        nc -l -p $port
done