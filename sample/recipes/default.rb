#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

package 'httpd'
service 'httpd' do
action [:enable, :start]
end
file '/var/www/html/index.html' do
content 'Chef server has been installed'
end



