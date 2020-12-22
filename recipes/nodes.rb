include_recipe "cloudera-manager::repo"

node['cloudera_manager']['nodes']['packages'].each do |pkg,ver|
  package pkg do
    if ver == "latest"
      action :upgrade
    elsif ver == "install"
      action :install
    end
    ignore_failure true
  end
end

template "/etc/cloudera-scm-agent/config.ini" do
  source 'config.ini.erb'
  notifies :restart, 'service[cloudera-scm-agent]'
end

service "cloudera-scm-agent" do
  supports :restart => true
  action [ :enable, :start ]
end




execute 'mkdir -p /opt/utilities'

template "/opt/utilities/cloudera-format.py" do
  source 'cloudera-format.py.erb'
end

execute 'format-drives' do
  command 'python2 /opt/utilities/cloudera-format.py -aFrm'
end


if node['cloudera_manager']['mount_nfs_shares'] == true

  node['cloudera_manager']['nfs']['packages'].each do |pkg,ver|
    package pkg do
      if ver == "latest"
        action :upgrade
      elsif ver == "install"
        action :install
      end
      ignore_failure true
    end
  end


  execute "create-network-mount-point" do
    command "mkdir -p #{node['cloudera_manager']['nfs']['local_mount_point']}"
  end


  mount "#{node['cloudera_manager']['nfs']['local_mount_point']}" do
    device "#{node['cloudera_manager']['nfs']['server_host']}:#{node['cloudera_manager']['nfs']['remote_mount_point']}"
    fstype "#{node['cloudera_manager']['nfs']['version']}"
    options "#{node['cloudera_manager']['nfs']['options']}"
    action [:mount, :enable]
  end
end
