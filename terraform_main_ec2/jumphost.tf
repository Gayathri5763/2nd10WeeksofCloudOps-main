resource "aws_instance" "anger_bro" {
    ami = "ami-08718895af4dfa033"
    key_name = "maven"
    instance_type = "t2.large"
    subnet_id = aws_subnet.pub_sub1.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    associate_public_ip_address = true
    iam_instance_profile = aws_iam_instance_profile.instance_profile.id
    root_block_device {
      volume_size = 30
    }
    user_data = templatefile("./install_tools.sh", {})

    tags = {
      Name = "new-Project"
    }
    
}