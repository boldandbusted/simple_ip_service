#
# Cookbook:: simple_ip_service
# Recipe:: default
#
# Copyright:: 2017,  The Authors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

include_recipe "chef_nginx::default"
include_recipe "yum::default" if node[:platform]=='centos' || node[:platform]=='redhat'
include_recipe "apt::default" if node[:platform]=='debian' || node[:platform]=='ubuntu'

if node[:platform]=='centos' || node[:platform]=='redhat'
  yum_globalconfig '/etc/yum.conf' do
    max_retries "0"
    action :create
  end
  %w{yum-priorities logwatch postfix-perl-scripts git}.each do |install|
    yum_package install
  end
end

package 'Install go and build tools' do
  package_name 'golang'
end

nginx_site 'default' do
  enable false
end

cookbook_file '/etc/nginx/sites-available/proxy_to_localhost' do
  source 'nginx/sites-available/proxy_to_localhost'
  action :create
end

user 'goapp' do 
  comment 'Non-privilged user to run a Go app as'
  manage_home true
  uid '5000'
  shell '/bin/bash'
end

bash 'install_go_build' do
  user 'goapp'
  code <<-EOH
  export GOPATH="/home/goapp"
  go get github.com/rdegges/ipify-api
  EOH
end

poise_service_user 'goapp'

poise_service 'ipify' do
  command '/home/goapp/bin/ipify-api'
  user 'goapp'
end

nginx_site 'proxy_to_localhost' do
    enable true
end
