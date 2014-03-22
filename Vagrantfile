#   Install with command

Vagrant.require_plugin 'vagrant-hostsupdater'

Vagrant.configure("2") do |config|
  config.vm.define "webserver" do |machine|
    machine.hostsupdater.aliases = ["drupal.dev"]

    machine.vm.network :private_network, ip: "10.0.0.10"

    machine.vm.synced_folder ".", "/vagrant", :disabled => false, :nfs => true, :windows__nfs_options => ["-exec"]
    machine.vm.synced_folder "./www", "/var/www/drupal", :disabled => false, :nfs => true, :windows__nfs_options => ["-exec"]

    machine.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["cookbooks", "chef/applications"]
      chef.roles_path = "chef/roles"
      chef.add_role "webserver"
    end

     machine.vm.provider :virtualbox do |vb, override|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.customize ["modifyvm", :id, "--cpus", "1"]
       override.vm.box = "ubuntu"
       override.vm.box_url = "http://files.vagrantup.com/precise32.box"
     end
  end
end
