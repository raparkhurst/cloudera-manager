name             'cloudera-manager'
maintainer       'Robert Parkhurst'
maintainer_email 'raparkhurst@digitalsynapse.io'
license          'All rights reserved'
description      'Installs/Configures cloudera-manager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'


depends "database"
depends "postgresql"
depends "mysql"
depends "users"
depends "sudo"


%w{ ubuntu }.each do |os|
  supports os
end

source_url 'https://github.com/raparkhurst/cloudera-manager'
issues_url 'https://github.com/raparkhurst/cloudera-manager/issues'
chef_version '>= 14' if respond_to?(:chef_version)
