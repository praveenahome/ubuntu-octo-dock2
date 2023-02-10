# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04
 
# Update the package repository and install Java 1.8
RUN apt-get update && apt-get install -y openjdk-8-jdk
 
# Install Node.js and npm
RUN apt-get install -y nodejs npm
 
# Set the working directory
WORKDIR /app
 
# Copy the welcome message to the image
COPY welcome.html /app/welcome.html
 
# Install the HTTP server
RUN npm install -g http-server
 
# Run the HTTP server and serve the welcome message
CMD ["http-server", "-p", "80", "-c-1", "welcome.html"]
