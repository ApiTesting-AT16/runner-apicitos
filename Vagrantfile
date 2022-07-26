# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'dotenv'
Dotenv.load
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 1
    vb.gui = false
    vb.name = ENV['GH_RUNNER_NAME']
  end
  config.vm.provision "shell", privileged: false, path: "runner-installer.sh", args: [ENV['GH_RUNNER_URL'], ENV['GH_RUNNER_TOKEN'], ENV['GH_RUNNER_NAME'], ENV['GH_RUNNER_LABELS']]
  config.vm.provision "shell", inline: "apt update && apt upgrade -y"
  config.vm.provision "shell", path: "dependencies.sh"
end
