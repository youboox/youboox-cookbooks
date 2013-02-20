node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails-rollback application #{application} as it is not a Rails app")
    next
  end

  foreman_export application do
    log "/var/log/#{application}.log"
    user deploy[:deploy_to]
    procfile "#{deploy[:current_path]}/Procfile"
    process_types ["job"]
  end
end
