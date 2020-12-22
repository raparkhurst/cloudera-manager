include_recipe "cloudera-manager::repo"

node['cloudera_manager']['master']['packages'].each do |pkg,ver|
  package pkg do
    if ver == "latest"
      action :upgrade
    elsif ver == "install"
      action :install
    end
    ignore_failure true
  end
end


if node[:cloudera_manager][:external_db] == true

  case node[:cloudera_manager][:database][:database_type]
  when "postgres"

    node['cloudera_manager']['database']['postgres']['pip_dependencies'].each do |pkg,ver|
      ruby_block "check-if-psycopyg2-is-installed" do
        block do
          if not `pip list --format=columns | grep #{pkg}`.include? "#{ver}"
            `pip install #{pkg}==#{ver} --ignore-installed`
          end
        end
      end
    end
  end
end





service "cloudera-scm-server-db" do
  supports :restart => true
  action [ :enable, :start ]
end

service "cloudera-scm-server" do
  supports :restart => true
  action [ :enable, :start ]
end