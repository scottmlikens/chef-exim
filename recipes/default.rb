#
# Cookbook Name:: exim4
# Recipe:: default
#
# Copyright 2012, Scott M. Likens
#

case node[:platform]
  when "ubuntu"
  %w{/var/cache/local /var/cache/local/preseeding}.each do |dirname|
    directory dirname do
      owner "root"
      group "root"
      mode  0644
      action :create
    end
  end
  template "/var/cache/local/preseeding/exim4.seed" do
    source "exim4.seed.erb"
    mode 0600
    owner "root"
    group "root"
  end
  package "exim4-config" do
    response_file "exim4.seed"
    action :install
  end
  package "exim4-base" do
    action :install
  end
  package "exim4-daemon-light" do
    action :install
  end

  template "/etc/exim4/passwd.client" do
    source "passwd.client.erb"
    owner "Debian-exim"
    group "Debian-exim"
    mode 0600
    variables(
              :username => "username",
              :password => "password"
              )
  end
  template "/etc/exim4/update-exim4.conf.conf" do
    source "update-exim4.conf.conf"
    owner "root"
    group "root"
    mode 0644
    variables(
              :readhost => "domain.com"
              )
  end

  service "exim4" do
    action [:start, :enable]
    subscribes :restart, resources(:template => "/etc/exim4/passwd.client"), :immediately
    subscribes :restart, resources(:template => "/etc/exim4/update-exim4.conf.conf"), :immediately
  end
end
