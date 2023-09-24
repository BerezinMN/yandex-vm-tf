resource "yandex_compute_instance" "lamp" {
  name        = "lamp"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd8dfofgv8k45mqv25nq"
    }
  }

  network_interface {
    subnet_id      = "e9b6uo6n7ieig6u0h6aj"
    nat_ip_address = "true"
  }

  metadata = {
    ssh-keys = "machine-key:${file("~/.ssh/id_rsa.pub")}"
  }
}


