resource "aws_security_group" "worker_sg" {
  name_prefix = "eks-worker"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "worker_ingress" {
  type              = "ingress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  security_group_id = aws_security_group.worker_sg.id
  cidr_blocks       = ["10.0.0.0/8"]
}

resource "aws_security_group_rule" "worker_egress" {
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  security_group_id = aws_security_group.worker_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}
