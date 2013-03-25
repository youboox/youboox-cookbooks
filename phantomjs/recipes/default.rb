bash "install_phantomjs" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget https://phantomjs.googlecode.com/files/phantomjs-1.9.0-linux-i686.tar.bz2
    tar -xjf phantomjs-1.9.0-linux-i686.tar.bz2
    mv phantomjs-1.9.0-linux-i686/bin/phantomjs /usr/local/bin/
  EOH
end
