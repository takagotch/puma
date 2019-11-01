# /opt/ added new application web server
#

vi /opt/myapp/config/puma.rb

# stop puma
ps aux | grep puma
kill -9 3117


# backup /etc/nginx/conf.d/default.conf
sudo mv /etc/nginx/conf.d/default.conf / etc/nginx/conf.d/default.conf_bk
sudo vi /etc/nginx/conf.d/myapp.conf

# start nginx
sudo sytemctl restart nginx.service
rails s

# change SELinux settings
getenforce
sudo setenforce 0
getenforce

sudo vi /etc/selinux/config
+ SELINUX=disabled
- SELINUX=enforcing


