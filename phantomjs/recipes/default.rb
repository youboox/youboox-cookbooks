remote_file "#{Chef::Config[:file_cache_path]}/phantomjs-1.9.0-linux-i686.tar.bz2" do
  source "https://phantomjs.googlecode.com/files/phantomjs-1.9.0-linux-i686.tar.bz2"
  notifies :run, "bash[install_phantomjs]", :immediately
end

bash "install_phantomjs" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zjf phantomjs-1.9.0-linux-i686.tar.bz2
    mv phantomjs-1.9.0-linux-i686/bin/phantomjs /usr/local/bin/
  EOH
  action :nothing
end
