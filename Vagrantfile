# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "opscode-centos-7.1"
  config.vm.network "private_network", ip: "192.168.33.111"

  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provision 'chef_solo' do |chef|
    chef.cookbooks_path = ['berks-cookbooks']
    chef.add_recipe 'php_nginx::default'
  end
end
