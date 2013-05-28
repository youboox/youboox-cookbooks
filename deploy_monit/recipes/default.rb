node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails-rollback application #{application} as it is not a Rails app")
    next
  end

  execute "setup monit for #{application}" do
    command "cp /srv/www/#{application}/current/monit/#{deploy[:rails_env]}.monitrc /etc/monit/conf.d/#{application}.monitrc"
  end

  execute "restart #{application}" do
    command "monit reload && sleep 2 && monit restart -g #{application}"
  end
end
