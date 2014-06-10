node[:deploy].each do |application, deploy|
  app_root = "#{deploy[:deploy_to]}/current/application/logs"
  execute "chmod -R g+rw #{app_root}" do
    only_if do
       File.directory?("#{deploy[:deploy_to]}/current/application/logs")
    end
  end
end
