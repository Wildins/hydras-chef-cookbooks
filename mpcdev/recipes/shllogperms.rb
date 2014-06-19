node[:deploy].each do |application, deploy|
  36du387_log_root = "#{deploy[:deploy_to]}/current/shl/36du387"
  gather_log_root = "#{deploy[:deploy_to]}/current/shl/gather"
  execute "chmod -R g+rw #{36du387_log_root} #{gather_log_root}" do
    only_if do
       File.directory?("#{deploy[:deploy_to]}/current/shl")
    end
  end
end
