arch = `uname -p` =~ /x86_64/ ? 'x86_64' : 'i686'
phantomjs = "phantomjs-1.9.8-linux-#{arch}"

bash "install_phantomjs" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget https://bitbucket.org/ariya/phantomjs/downloads/#{phantomjs}.tar.bz2
    tar -xjf #{phantomjs}.tar.bz2
    mv #{phantomjs}/bin/phantomjs /usr/local/bin/
  EOH
end
