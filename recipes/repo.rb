case node['platform']
  when 'ubuntu'
    apt_repository 'cloudera-manager' do
      uri           'http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm'
      key           'https://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/archive.key'
      arch          'amd64'
      distribution  "trusty-cm5"
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