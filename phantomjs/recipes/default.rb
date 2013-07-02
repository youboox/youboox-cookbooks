arch = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i686"

bash "install_phantomjs" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget https://phantomjs.googlecode.com/files/phantomjs-1.9.0-linux-#{arch}.tar.bz2
    tar -xjf phantomjs-1.9.0-linux-#{arch}.tar.bz2
    mv phantomjs-1.9.0-linux-#{arch}/bin/phantomjs /usr/local/bin/
  EOH
end
