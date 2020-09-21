#HCL main
build {
    source "source.yandex.yc" {
        communicator = "ssh"
    }
    provisioner "shell"{
        script = "./files/install_ruby.sh"
        execute_command = "sudo {{.Path}}" 
        pause_before = "10s"
    }
    provisioner "shell"{
        script = "./files/install_mongodb.sh"
        execute_command = "sudo {{.Path}}" 
    }
    provisioner "file"{
        destination = "/tmp/"
        source = "./files/puma.service" 
    }
    provisioner "shell"{
        script = "./files/deploy.sh"
        execute_command = "sudo {{.Path}}" 
    }
}