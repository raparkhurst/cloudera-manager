include_recipe "cloudera-manager::repo"

package ["cloudera-manager-daemons", "cloudera-manager-agent"] do
  action :upgrade
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

