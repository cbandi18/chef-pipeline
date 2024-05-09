#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# Recipe to install Apache web server and display a simple HTML page

# Install Apache package
package 'apache2' do
  action :install
end
# Start and enable Apache service
service 'apache2' do
  action [:start, :enable]
end
# Create HTML file
file '/var/www/html/index.html' do
  content '<!DOCTYPE html>
  <html>
  <head>
    <title>Welcome to Chef Apache</title>
  </head>
  <body>
    <h1>Hello from Chef!</h1>
    <p>This is a simple HTML page served by Apache web server managed by Chef.</p>
  </body>
  </html>'
  mode '0644'
  owner 'root'
  group 'root'
  action :create
end
