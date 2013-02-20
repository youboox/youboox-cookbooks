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
    command "foreman export -f /srv/www/#{application}/current/Procfile -a #{application} -u deploy -l /var/log/ upstart /etc/init"
    notifies :restart, resources(:service => application)
  end
end
