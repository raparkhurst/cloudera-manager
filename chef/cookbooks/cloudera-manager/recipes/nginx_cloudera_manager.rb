#
# Cookbook Name:: nginx-cloudera-manager
# Recipe:: nginx_server
#
# Copyright 2017, Digital Synapse, LLC
#
# All rights reserved - Do Not Redistribute
#

#
# This recipe helps configure NGINX for Cloudera Manager
#

chef_gem "chef-vault"
require 'chef-vault'


include_recipe "nginx"


if node[:vagrant] == "true"
  nginx_item = data_bag_item('ssl','wildcard')
else
  begin
    nginx_item = ChefVault::Item.load(node['cloudera_manager']['chef-vault']['vault'],node['cloudera_manager']['chef-vault']['data_bag'])
  rescue
    nginx_item = ChefVault::Item.load(node['cloudera_manager']['chef-vault']['vault'],node['cloudera_manager']['chef-vault']['wildcard_bag'])
  end
end


directory "#{node['cloudera_manager']['nginx']['cloudera_manager']['home_dir']}" do
  action :create
end

directory "#{node['cloudera_manager']['nginx']['cloudera_manager']['ssl_dir']}" do
  action :create
end

directory "#{node['cloudera_manager']['nginx']['cloudera_manager']['sites_available_dir']}" do
  action :create
end

directory "#{node['cloudera_manager']['nginx']['cloudera_manager']['sites_enabled_dir']}" do
  action :create
end


# nginx  template
template "#{node['cloudera_manager']['nginx']['cloudera_manager']['sites_available_dir']}/#{node['cloudera_manager']['nginx']['cloudera_manager']['site_name']}-#{node['hostname']}" do
  source "nginx_site.erb"
  variables({
      :int_port_fwd => node['cloudera_manager']['nginx']['cloudera_manager']['int_port_fwd'],
      :ssl_enabled => node['cloudera_manager']['nginx']['cloudera_manager']['ssl_enabled'],
      :hostname => node['cloudera_manager']['nginx']['cloudera_manager']['hostname']
            })
  action :create
  notifies :restart, "service[nginx]"
end


# install our keys
template "#{node['cloudera_manager']['nginx']['ssl_dir']}/#{node['cloudera_manager']['nginx']['cloudera_manager']['ssl_crt_file']}" do
  source 'nginx_cert.crt.erb'
  variables({
                :crt_contents => nginx_item['crt']
            })
  notifies :restart, "service[nginx]"
end

template "#{node['cloudera_manager']['nginx']['ssl_dir']}/#{node['cloudera_manager']['nginx']['cloudera_manager']['ssl_key_file']}" do
  source 'nginx_cert.key.erb'
  variables({
                :key_contents => nginx_item['key']
            })
  notifies :restart, "service[nginx]"
end

template "#{node['cloudera_manager']['nginx']['ssl_dir']}/#{node['cloudera_manager']['nginx']['cloudera_manager']['ssl_csr_file']}" do
  source 'nginx_cert.csr.erb'
  variables({
                :csr_contents => nginx_item['csr']
            })
  notifies :restart, "service[nginx]"
end


[ "default", "000-default" ].each do |file|
  link "/etc/nginx/sites-enabled/#{file}" do
    action :delete
    notifies :restart, "service[nginx]"
  end
end


link "/etc/nginx/sites-enabled/#{node['hostname']}" do
  to "/etc/nginx/sites-available/#{node['hostname']}"
  notifies :restart, "service[nginx]"
end



package "apache2" do
  action :purge
  notifies :restart, "service[nginx]"
end
