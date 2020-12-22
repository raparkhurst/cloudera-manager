include_recipe "cloudera-manager::repo"

package ["cloudera-manager-daemons", "cloudera-manager-server-db", "cloudera-manager-server"] do
  action :upgrade
end


service "cloudera-scm-server-db" do
  supports :restart => true
  action [ :enable, :start ]
end

service "cloudera-scm-server" do
  supports :restart => true
  action [ :enable, :start ]
end