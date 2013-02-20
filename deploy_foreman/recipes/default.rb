gem_package "foreman"

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails-rollback application #{application} as it is not a Rails app")
    next
  end

  service application do
    action [:enable]
  end

  execute "setup foreman for #{application}" do
    command "foreman export inittab /etc/init.d/#{application} --user=deploy -l /var/log/ -f '#{deploy[:current_path]}/Procfile'"
    notifies :restart, resources(:service => application)
  end
end
