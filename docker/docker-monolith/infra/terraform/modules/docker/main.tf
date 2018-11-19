resource "google_compute_instance" "docker" {
  name         = "dockerhost0${count.index+1}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  count        = "${var.count}"

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  tags = ["docker"]

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }
}
