gem_package "foreman"

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails-rollback application #{application} as it is not a Rails app")
    next
  end

  execute "setup foreman for #{application}" do
    command "foreman export -f /srv/www/#{application}/current/Procfile -a #{application} -u deploy -l /var/log/#{application} -e /srv/www/#{application}/current/#{deploy[:rails_env]}.env upstart /etc/init -c worker=2"
  end

  execute "restart #{application}" do
    command "initctl restart #{application} || initctl start #{application}"
  end
end
