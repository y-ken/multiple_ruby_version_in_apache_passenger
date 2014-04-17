# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :multiple_ruby_in_apache_passenger
  config.vm.box = "CentOS-6.4-x86_64-v20131103"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provider :virtualbox do |vb|
    # customize as you like
    #vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "8"]
  end
end
