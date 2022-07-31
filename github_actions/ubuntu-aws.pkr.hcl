packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "access_key" {
  type    = string
  default = "${env("AWS_ACCESS_KEY_ID")}"
}

variable "secret_key" {
  type      = string
  default   = "${env("AWS_SECRET_ACCESS_KEY")}"
  sensitive = true
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "quick-start" {
  access_key    = "${var.access_key}"
  ami_name      = "packer-example ${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  secret_key    = "${var.secret_key}"
  #source_ami    = "ami-af22d9b9"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
  most_recent = true
  owners      = ["099720109477"]
  }
  ssh_username  = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.quick-start"]
}