#!/bin/bash

# 完全卸载 Nginx 及其配置、日志和缓存文件（危险操作！）
# 警告：此脚本将永久删除所有 Nginx 相关文件和目录，谨慎使用！

echo "正在停止 Nginx 服务..."
sudo systemctl stop nginx

echo "卸载 Nginx 软件包及配置文件..."
sudo apt-get purge nginx* -y

echo "删除残留目录..."
sudo rm -rf /etc/nginx          # 配置目录
sudo rm -rf /var/log/nginx      # 日志目录
sudo rm -rf /var/www/html       # 默认网站根目录
sudo rm -rf /var/cache/nginx    # 缓存目录

echo "清理系统依赖和缓存..."
sudo apt-get clean
sudo apt-get autoremove -y

echo "验证卸载结果..."
nginx -v 2>/dev/null || echo "Nginx 已成功卸载"
