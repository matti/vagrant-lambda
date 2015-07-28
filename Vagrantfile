Vagrant.configure(2) do |config|
  config.vm.box = "matti/fedora-22"

  config.vm.provider "virtualbox" do |vbox|
    cpus = `sysctl -n hw.ncpu`.to_i
    mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4

    vbox.memory = mem
    vbox.cpus = cpus
  end

  # https://github.com/mitchellh/vagrant/issues/5186#issuecomment-125538877
  config.ssh.insert_key = false

  config.vm.provision :shell, path: "bootstrap.sh"
end
