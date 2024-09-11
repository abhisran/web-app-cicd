#!/bin/bash

# Ensure NGINX is installed via Amazon Linux Extras
if ! [ -x "$(command -v nginx)" ]; then
  echo "NGINX is not installed. Installing NGINX."
  sudo amazon-linux-extras install nginx1 -y
fi

# Ensure NGINX directory exists
if [ ! -d "/var/www/html" ]; then
  echo "Creating NGINX web root directory."
  sudo mkdir -p /var/www/html
fi

# Copy the web files to NGINX default directory
echo "Copying web files to NGINX web root."
sudo cp -r /tmp/web-app/* /var/www/html/

# Set proper permissions
sudo chmod -R 755 /var/www/html

# Start or restart NGINX
sudo systemctl restart nginx

echo "Deployment successful!"
