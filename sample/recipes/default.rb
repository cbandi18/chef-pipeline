#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# Cookbook:: my_web_server
# Recipe:: default

# Install Nginx package
package 'nginx' do
  action :install
end

# Start and enable Nginx service
service 'nginx' do
  action [:start, :enable]
end

# Create a simple HTML file
file '/var/www/html/index.html' do
  content '<html><body><h1>Hello, Chef!</h1></body></html>'
  action :create
end








