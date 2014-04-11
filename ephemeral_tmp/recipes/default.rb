directory "/mnt/tmp" do
  action :create
  mode "1777"
end

execute 'mount -B /tmp /mnt/tmp' do
end
