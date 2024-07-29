resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::891377358561:role/ec2-admin"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-06d8a52ca9bd8c56e", "subnet-0f447d6c84c376e9f"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0425bcc719de8fc88"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "jawan" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "jawan"
  node_role_arn   = "arn:aws:iam::891377358561:role/ec2-admin"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-06d8a52ca9bd8c56e", "subnet-0f447d6c84c376e9f"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 4
    min_size     = 2
  }

  tags = {
    Environment = "Production"
  }
}
