node[:deploy].each do |application, deploy|
  log_root = "#{deploy[:deploy_to]}/current/shl"
  execute "chmod -R g+rw #{log_root}" do
    only_if do
       File.directory?("#{deploy[:deploy_to]}/current/shl")
    end
  end
end
