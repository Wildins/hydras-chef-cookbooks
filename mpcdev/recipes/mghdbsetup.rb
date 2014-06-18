node[:deploy].each do |app_name, deploy|

  template "#{deploy[:deploy_to]}/current/library/db.php" do
    source "mgh_database.php.erb"
    mode 0644
    group deploy[:group]

    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "deploy"
    end

    variables(
      :host =>     (deploy[:database][:host] rescue nil),
      :user =>     (deploy[:database][:username] rescue nil),
      :password => (deploy[:database][:password] rescue nil),
      :db =>       (deploy[:database][:database] rescue nil)
    )

   only_if do
     File.directory?("#{deploy[:deploy_to]}/current/library")
   end
  end
end
