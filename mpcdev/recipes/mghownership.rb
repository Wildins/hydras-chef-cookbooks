node[:deploy].each do |application, deploy|
  app_root = "/srv/www/mgh/current"
  execute "chown -R apache #{app_root}/*" do
    only_if do
       File.directory?("/srv/www/mgh/current")
    end
  end
end
