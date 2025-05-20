terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2"
    }
  }
}

provider "virtualbox" {}

# Kali
resource "virtualbox_vm" "kali" {
  name        = "kali"
  image       = "kali.vdi"
  cpus        = 4
  memory      = 2048
  vram        = 16
  mac_address = "auto"

  network_adapter {
    type           = "intnet"
    host_interface = "RedInternaLAN"
  }

  disk {
    size = 75
  }
}

# Windows 10 Home
resource "virtualbox_vm" "windows10" {
  name        = "windows10"
  image       = "windows10.vdi"
  cpus        = 2
  memory      = 2048
  vram        = 16
  mac_address = "auto"

  network_adapter {
    type           = "intnet"
    host_interface = "RedInternaLAN"
  }

  disk {
    size = 70
  }
}

# Ubuntu Desktop 22
resource "virtualbox_vm" "ubuntu" {
  name        = "ubuntu"
  image       = "ubuntu.vdi"
  cpus        = 2
  memory      = 2048
  vram        = 16
  mac_address = "auto"

  network_adapter {
    type           = "intnet"
    host_interface = "RedInternaLAN"
  }

  disk {
    size = 55
  }
}

# pfSense
resource "virtualbox_vm" "pfsense" {
  name        = "pfsense"
  image       = "pfsense.vdi"
  cpus        = 1
  memory      = 1024
  vram        = 16
  mac_address = "auto"

  # Adaptador 1: Puente
  network_adapter {
    type           = "bridged"
    host_interface = "enp0s3" # Reemplaza con tu interfaz de red
  }

  # Adaptador 2: Red interna
  network_adapter {
    type           = "intnet"
    host_interface = "RedInternaLAN"
  }

  disk {
    size = 36
  }
}
