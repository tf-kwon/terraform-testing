variable "instance_type" {
  description = "VMインスタンスタイプ定義"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2インスタンスの名前"
  default     = "my_ec2"
}
