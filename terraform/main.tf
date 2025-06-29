resource "google_compute_instance" "vm_from_packer_image" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/${var.image_name}"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash

    # Installation de l'agent Ops (logs + metrics)
    curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
    sudo bash add-google-cloud-ops-agent-repo.sh --also-install
    systemctl restart google-cloud-ops-agent

    echo "Instance from Packer image ready."
  EOT

  metadata = {
    ssh-keys = "admin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVGg8jMFSwwc1G0s4ZxAczHRZNnRJ7UzoI9gC35eA2iYQqZMJSc45LfcIMQypoqlIiqagRQcKw7X9nHir0k2aLGIPDyekeoOny0IZaq0x2zXyIbSTc75SiByHtXNMrEdeenjTbGy6xocV1g8+HGIF/nMdqOCsC3qWyu5Bz0RctbiTNLWFDsPd0SQLTii+xqts/AhB0ok3wj5v9CqCeQf+lDY92+Rqis/eL8Gx3b9O4XhJ5YXGaoh6bt10/e4Ng6wboDIKGKFs49eg8v9Zu/Q04+iFHykDGPKZ4XOHVcEZLSRX64k6VtrKEwcV9jBgOiGR/NhxDoZ/RX0WcUYuFytV/ parsy@Alexis-Home"
  }

  tags = ["web"]
}

output "instance_ip" {
  value = google_compute_instance.vm_from_packer_image.network_interface[0].access_config[0].nat_ip
}
