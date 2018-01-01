# Use the official Archlinux base as parent image
FROM base/archlinux:latest
LABEL maintainer "infosec-dockers"

# Set the working directory to /root
WORKDIR /root

# Copy the current directory contents into the container at /root
ADD . /root

# Update archlinux pacman database
RUN pacman -Syy

# Install any needed packages specified in requirements.txt
RUN pacman -S - --noconfirm < requirements.txt

# Clean pacman database again
RUN rm -rf \
      /usr/share/man/* \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      README.md

# Make port 22 available to the world outside this container
EXPOSE 22

# Define environment variable
ENV NAME World

# Run bash when the container launches
CMD ["bash","--login"]
