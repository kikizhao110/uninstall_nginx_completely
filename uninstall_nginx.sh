#!/bin/bash
sudo systemctl stop nginx
sudo apt-get purge nginx -y
sudo rm -rf /etc/nginx
sudo rm -rf /var/log/nginx
sudo rm -rf /var/www/html
sudo rm -rf /var/cache/nginx
sudo apt-get clean
if ! command -v nginx &> /dev/null; then
    echo "Nginx has been successfully uninstalled."
else
    echo "Nginx is still installed."
fi
