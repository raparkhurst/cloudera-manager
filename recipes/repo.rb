case node['platform']
  when 'ubuntu'
    apt_repository 'cloudera-manager' do
      uri           'http://archive.cloudera.com/cm6/6.3.0/ubuntu1804/apt'
      key           'https://archive.cloudera.com/cm6/6.3.0/ubuntu1804/apt/archive.key'
      distribution  'bionic-cm6.3.0'
      arch          'amd64'
      components    ['contrib']
      deb_src       true
      action        :add
    end
  when 'centos','rhel'
    log "not supported!"
end

# Install repo keys and other necessary components (i.e cloudera.pref file for Ubuntu)
case node['platform']
  when 'ubuntu'
    template "/etc/apt/preferences.d/cloudera.pref" do
      source 'cloudera.pref.erb'
      #notifies :restart, "service[logstash]"
    end

  when 'centos'
    log "Not supported yet!"
end
