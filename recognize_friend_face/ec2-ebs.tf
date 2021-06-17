provider "aws" {
	region = "us-east-1"
	profile = "default"
}


resource "aws_instance" "os1" {
	ami = "ami-0aeeebd8d2ab47354"
	instance_type = "t2.micro"
	tags = {
	       Name = "task6"
	}
}

resource "aws_ebs_volume" "storage1" {
	availability_zone = aws_instance.os1.availability_zone
	size = 5 
	tags = {
	       Name = "task6-ebs"
	}
}

resource "aws_volume_attachment"  "ebs_attach" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.storage1.id
	instance_id = aws_instance.os1.id
}