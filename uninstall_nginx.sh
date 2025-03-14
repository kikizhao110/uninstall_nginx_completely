#!/bin/bash

# 停止Nginx服务
sudo systemctl stop nginx

# 完全卸载Nginx软件包，包括配置文件
sudo apt-get purge nginx -y

# 删除残留的配置文件、日志和网站目录
sudo rm -rf /etc/nginx
sudo rm -rf /var/log/nginx
sudo rm -rf /var/www/html
sudo rm -rf /var/cache/nginx

# 清理包管理器缓存
sudo apt-get clean

#依赖包清理
sudo apt-get autoremove -y

# 验证卸载
if ! command -v nginx &> /dev/null; then
    echo "Nginx has been successfully uninstalled."
else
    echo "Nginx is still installed. Please check for any remaining packages or configurations."
fi