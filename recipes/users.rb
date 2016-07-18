include_recipe "users"

users_manage "cloudera" do
  group_id 4001
  action [ :create ]
end

# Set Sudoers
node["cloudera_manager"]["admins"].each do |grp|
  sudo "#{grp}" do
    group "#{grp}"
    nopasswd true
  end
end
