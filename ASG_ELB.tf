
## Creating Launch Configuration
resource "aws_launch_configuration" "LC1" {
  image_id       = lookup(var.ami_id, var.region)
  instance_type = var.instance_type

# Security group assign to instance
  security_groups = [aws_security_group.Webserver-sg.id]
  
# key name
  key_name = var.key_name

}

## Creating AutoScaling Group
resource "aws_autoscaling_group" "Project-ASG" {
  launch_configuration = "${aws_launch_configuration.LC1.id}"
  min_size = 2
  max_size = 5
  desired_capacity = 2
  health_check_grace_period = 300
  force_delete = true
  health_check_type = "ELB"
  vpc_zone_identifier = [ "${var.Publicsubnet}" ]
  tag {
    key = "Name"
    value = "Project-ASG"
    propagate_at_launch = true
  }


  lifecycle { create_before_destroy = true }
}

### Creating Classic load balancer attach ASG
resource "aws_elb" "ELB" {
  name = "Project-ELB"
  security_groups = ["${aws_security_group.ELB-sg.id}"]
  subnets = [ "${var.Publicsubnet}" ]
  cross_zone_load_balancing   = true
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
 
  
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.Project-ASG.id
  elb                    = aws_elb.ELB.id
}

output "elb_dns_name" {
  value = "aws_elb.ELB.dns_name"
}