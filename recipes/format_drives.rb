execute 'mkdir -p /opt/utilities'

template "/opt/utilities/cloudera-format.py" do
  source 'cloudera-format.py.erb'
end

execute 'format-drives' do
  command 'python2 /opt/utilities/cloudera-format.py -aFrm'
end
