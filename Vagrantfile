# -*- mode: ruby -*-

private_network_ip = '172.20.0.101'
username = %w{USER USERNAME}.map{|x|u=(ENV[x]||'').gsub(/[^\w]/,''); u unless u.empty?}.compact.first
if username.nil?
  puts 'ERROR: Could not determine username from environment'
  exit 1
end




# This script can be replaced with the "config.omnibus" provisioning directive
# (requires "vagrant plugin install vagrant-omnibus"), but that does not save 
# a copy of the package locally for re-use.  I prefer this method slightly.
$preSetupScript = <<PRESCRIPT
  if ! dpkg -s chef
  then
    echo "Acquiring and installing Chef client package."
    PKGDIR=/vagrant/.packages

    #PKGURL=https://packages.chef.io/stable/ubuntu/10.04/chef_12.9.41-1_amd64.deb
    #PKGURL=https://packages.chef.io/files/stable/chef/12.17.44/ubuntu/16.04/chef_12.17.44-1_amd64.deb
    PKGURL=https://packages.chef.io/files/stable/chef/12.11.18/ubuntu/14.04/chef_12.11.18-1_amd64.deb

    PKGFILE=$PKGDIR/$(basename "$PKGURL")
    if [ ! -f $PKGFILE ]
    then
      [ -d $PKGDIR ] || mkdir -p $PKGDIR
      wget -q -O $PKGFILE $PKGURL
    fi
    dpkg -i $PKGFILE
  fi

  apt-get update
PRESCRIPT




VAGRANT_API_VERSION = '2'
Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--cpus', '4']
#    vb.customize ['modifyvm', :id, '--memory', '20480']
    vb.customize ['modifyvm', :id, '--memory', '12384']
  end

  config.omnibus.chef_version = '12.11.18'

  config.vm.hostname = "cloudera-#{username}"
  config.vm.network :private_network, ip: private_network_ip
  #config.vm.box = 'bento/ubuntu-16.04'

  config.vm.box = 'opscode_ubuntu-14.04_chef-provisionerless.box'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'

  
  config.vm.synced_folder "~/Documents", "/data"
  
  #config.vm.provision :shell, :inline => $preSetupScript

  config.vm.provision :chef_client do |chef|
#    chef.cookbooks_path = [ "./chef/cookbooks" ]
#    chef.roles_path = [ "./chef/roles" ]
#    chef.data_bags_path = "~/projects/digitalsynapse/chef-digitalsynapse/data_bags"
#    chef.environments_path = [ "~/projects/digitalsynapse/chef-digitalsynapse/environments" ]

    chef.node_name = config.vm.hostname
    chef.chef_server_url = 'https://chef.digitalsynapse.io/organizations/digitalsynapse'
    chef.validation_key_path = '~/.chef/digitalsynapse-validator.pem'

    chef.validation_client_name = 'digitalsynapse-validator'

    chef.environment = "development"
    chef.delete_node = true
    chef.delete_client = true
    
    chef.json = {
      "ds-base" => {
        "nginx" => {
          "int_port_fwd" => "7180"
        }
      },
      "cloudera_manager" => {
        "server_host" => "172.20.0.101"
      },
      "vagrant" => "true"
    }

    chef.add_role "base_all"
    chef.add_role "java_8"
    chef.add_recipe "cloudera-manager::master"
    chef.add_recipe "cloudera-manager::nodes"
                 
  end
end
