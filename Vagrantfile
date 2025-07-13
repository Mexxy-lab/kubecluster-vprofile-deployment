VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/jammy64"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  # Master Node
  config.vm.define "master-node" do |node|
    node.vm.hostname = "master-node"
    node.vm.network "private_network", ip: "192.168.56.17"
    node.vm.synced_folder ".", "/vagrant", disabled: true

    node.vm.provider :virtualbox do |v|
      v.memory = 6144
      v.cpus = 2
    end

    node.vm.provision "shell", inline: <<-SHELL
      set -e
      export DEBIAN_FRONTEND=noninteractive
      apt-get update -y
      apt-get upgrade -yq
      apt-get install -y python3 python3-pip python-is-python3
      apt-get install -y apt-transport-https ca-certificates curl unzip zip software-properties-common lsb-release
      install -m 0755 -d /etc/apt/keyrings
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        tee /etc/apt/keyrings/docker.asc > /dev/null
      chmod a+r /etc/apt/keyrings/docker.asc
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
      apt-get update -y
      apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      groupadd docker || true
      usermod -aG docker vagrant
      systemctl enable docker
      systemctl start docker
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      ./aws/install
      rm -rf aws awscliv2.zip
      echo "Docker version:"
      docker --version
      echo "AWS CLI version:"
      aws --version
    SHELL
  end

  # Worker Node 1
  config.vm.define "worker-node1" do |node|
    node.vm.hostname = "worker-node1"
    node.vm.network "private_network", ip: "192.168.56.18"
    node.vm.synced_folder ".", "/vagrant", disabled: true

    node.vm.provider :virtualbox do |v|
      v.memory = 2048
      v.cpus = 2
    end

    node.vm.provision "shell", inline: <<-SHELL
      set -e
      export DEBIAN_FRONTEND=noninteractive
      apt-get update -y
      apt-get upgrade -yq
      apt-get install -y python3 python3-pip python-is-python3
      apt-get install -y apt-transport-https ca-certificates curl unzip zip software-properties-common lsb-release
      install -m 0755 -d /etc/apt/keyrings
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        tee /etc/apt/keyrings/docker.asc > /dev/null
      chmod a+r /etc/apt/keyrings/docker.asc
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
      apt-get update -y
      apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      groupadd docker || true
      usermod -aG docker vagrant
      systemctl enable docker
      systemctl start docker
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      ./aws/install
      rm -rf aws awscliv2.zip
      echo "Docker version:"
      docker --version
      echo "AWS CLI version:"
      aws --version
    SHELL
  end

  # Optional: Add worker-node2 if needed
  config.vm.define "worker-node2" do |node|
    node.vm.hostname = "worker-node2"
    node.vm.network "private_network", ip: "192.168.56.19"
    node.vm.synced_folder ".", "/vagrant", disabled: true
  
    node.vm.provider :virtualbox do |v|
      v.memory = 2048
      v.cpus = 2
    end
  
    node.vm.provision "shell", inline: <<-SHELL
      set -e
      export DEBIAN_FRONTEND=noninteractive
      apt-get update -y
      apt-get upgrade -yq
      apt-get install -y python3 python3-pip python-is-python3
      apt-get install -y apt-transport-https ca-certificates curl unzip zip software-properties-common lsb-release
      install -m 0755 -d /etc/apt/keyrings
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        tee /etc/apt/keyrings/docker.asc > /dev/null
      chmod a+r /etc/apt/keyrings/docker.asc
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
      apt-get update -y
      apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      groupadd docker || true
      usermod -aG docker vagrant
      systemctl enable docker
      systemctl start docker
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip awscliv2.zip
      ./aws/install
      rm -rf aws awscliv2.zip
      echo "Docker version:"
      docker --version
      echo "AWS CLI version:"
      aws --version
    SHELL
  end  
end

