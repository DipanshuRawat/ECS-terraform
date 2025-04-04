output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet1_id" {
  description = "ID of public subnet 1"
  value       = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  description = "ID of public subnet 2"
  value       = aws_subnet.public_subnet2.id
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.medusa_lb.dns_name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.medusa_target_group.arn
}

output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.main.id
}

output "ecs_task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.medusa.arn
}
