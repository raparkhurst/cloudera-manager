case node[:cloudera_manager][:sentry][:database_type]
when 'postgres'

  ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
  node.normal_unless['cloudera_manager']['sentry']['database_password'] = secure_password
  node.normal_unless['cloudera_manager']['sentry']['database_name'] = node['cloudera_manager']['sentry']['database_name']


  postgresql_user node['cloudera_manager']['sentry']['database_user'] do
    superuser false
    password node['cloudera_manager']['sentry']['database_password']
    sensitive true
  end

  postgresql_database "#{node['cloudera_manager']['sentry']['database_name']}" do
    owner node['cloudera_manager']['sentry']['database_user']
    locale 'en_US.UTF-8'
  end

  postgresql_access "allow_access_to_user #{node['cloudera_manager']['sentry']['database_user']}" do
    comment "#{node['cloudera_manager']['sentry']['database_user']} user access"
    access_type 'host'
    access_db 'all'
    access_user node['cloudera_manager']['sentry']['database_user']
    access_addr '0.0.0.0/0'
    access_method 'md5'
  end




  ### MySQL Connection follows
else

  ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
  node.default_unless['cloudera_manager']['sentry']['database_password'] = secure_password
  node.default_unless['cloudera_manager']['sentry']['database_name'] = node['cloudera_manager']['sentry']['database_name']


  mysql_connection_info = {
      :host     => node['cloudera_manager']['sentry']['database_host'],
      :username => 'root',
      :password => node['mysql']['root']['password']
  }

  database node['cloudera_manager']['sentry']['database_name'] do
    connection        mysql_connection_info
    provider          Chef::Provider::Database::Mysql
    action            :create
  end


  mysql_database_user node['cloudera_manager']['sentry']['database_user'] do
    connection        mysql_connection_info
    password          node['cloudera_manager']['sentry']['database_password']
    database_name     node['cloudera_manager']['sentry']['database_name']
    provider          Chef::Provider::Database::MysqlUser
    host              '%'
    privileges        [:all]
    action            [:create,:grant]
  end



end

