resource "aws_key_pair" "mykey" {
  key_name   = "terra_win19"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "webservers" {
  count           = length(var.subnets_cidr)
  ami             = var.webservers_ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.webservers.id]
  subnet_id       = element(aws_subnet.private_subnet.*.id, count.index)
  key_name        = aws_key_pair.mykey.key_name

  tags = {
    Name = "WinServer-${count.index}"
  }

  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  # WinRM will not work unless you include a SG here to allow
  # traffic from TCP ports 5985/5986.
  connection {
    type     = "winrm"
    user     = var.instance_admin
    password = var.instance_password
    #my_ip_add = var.my_ip_address
    # Limit for WinRM timeout
    timeout = "10m"
  }
  # Root storage
  # Terraform doesn't allow encryption of root at this time
  # encrypt volume after deployment.
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }
  ########### Windows OS configuration, WinRM and PowerShell Provision Functions
  user_data = templatefile("user_data.sh.tpl", { user = var.instance_admin, password = var.instance_password, my_ip_add = var.my_ip_address })

}
