#!/bin/bash

# Ensure NGINX is installed
if ! [ -x "$(command -v nginx)" ]; then
  echo "NGINX is not installed. Installing NGINX."
  yum install -y nginx
fi

# Copy the web files to NGINX default directory
echo "Copying web files to NGINX web root."
cp -r /tmp/web-app/* /var/www/html/

# Set proper permissions
chmod -R 755 /var/www/html

# Start or restart NGINX
systemctl restart nginx

echo "Deployment successful!"
