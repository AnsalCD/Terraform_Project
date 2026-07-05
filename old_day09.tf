# # Security Group
# resource "aws_security_group" "app_sg" {
#   name        = "app-security-group"
#   description = "Security group for application servers"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow HTTP from anywhere"
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow HTTPS from anywhere"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow all outbound traffic"
#   }

#     tags = var.tags
    
# }

# # EC2 Instance that gets replaced when security group changes
# resource "aws_instance" "app_with_sg" {
#   ami                    = "ami-0ff8a91507f77f867"
#   instance_type          = var.allowed_vm_types[0]
#   vpc_security_group_ids = [aws_security_group.app_sg.id]

#   tags = var.tags

#   # Lifecycle Rule: Replace instance when security group changes
#   # This ensures the instance is recreated with new security rules
#   lifecycle {
#     replace_triggered_by = [
#       aws_security_group.app_sg.id
#     ]
#   }
# }