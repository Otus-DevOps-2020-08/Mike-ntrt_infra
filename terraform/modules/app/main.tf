resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  #connection {
  #  type  = "ssh"
  #  host  = self.network_interface.0.nat_ip_address
  #  user  = "ubuntu"
  #  agent = false
  #  # путь до приватного ключа
  #  private_key = file(var.private_key_path)
  #}
#
  #provisioner "file" {
  #  content = templatefile("../modules/app/puma.service", {
  #  database_url = var.database_url,})
  #  destination = "/tmp/puma.service"
  #}
#
  #provisioner "remote-exec" {
  #  script = "../modules/app/deploy.sh"
  #}
}
