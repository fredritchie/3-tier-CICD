resource "aws_codedeploy_app" "webapp" {
  compute_platform = "Server"
  name             = "webapp"
}

resource "aws_codedeploy_deployment_group" "CodeDeployWebapp" {
  app_name              = aws_codedeploy_app.webapp.name
  deployment_group_name = "CodeDeployWebapp"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  load_balancer_info {
    target_group_info  {
      name = aws_lb_target_group.webapp-TG.name
        }
  }
    autoscaling_groups = [aws_autoscaling_group.webapp_asg.name] # Replace with your Auto Scaling group name
    deployment_config_name = "CodeDeployDefault.AllAtOnce"  # Use "AllAtOnce" deployment configuration

}