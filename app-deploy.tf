resource "null_resource" "app-deploy" {
  provisioner "remote-exec" {
    connection {
      host     = aws_instance.ec2.public_ip
      user     = local.ssh_user
      password = local.ssh_pass
    }

    inline = [
#      "ansible-pull -U https://github.com/kana-Gayatri/ansible.git roboshop-pull.yml -e ENV=${var.ENV} -e COMPONENT=${var.COMPONENT} "
      "ansible-pull -U https://github.com/kana-Gayatri/ansible.git roboshop-pull.yml -e ENV=ENV -e COMPONENT=${var.COMPONENT} -e APP_VERSION=${var.APP_VERSION} -e NEXUS_USER=${local.NEXUS_USER} -e NEXUS_PASS=${local.NEXUS_PASS} -e AMI=true"
    ]
  }
}
