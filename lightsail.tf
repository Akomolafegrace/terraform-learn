resource "aws_lightsail_instance" "example" {
  name              = "example-lightsail-instance"
  availability_zone = "us-east-1a"  
  blueprint_id      = "amazon_linux_2"  
  bundle_id         = "nano_1_0"  
  #key_pair_name     = "your-key-pair-name"  

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo echo "<h1>This server is created using Terraform</h1>" >> /var/www/html/index.html
  EOF