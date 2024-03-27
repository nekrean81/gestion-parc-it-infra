resource "random_integer" "priority" {
  min = 1
  max = 50000
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    listener_arn = var.listener_arn
  }
}

resource "aws_alb_listener_rule" "main" {
  listener_arn = random_integer.priority.keepers.listener_arn
  priority     = random_integer.priority.result

  action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
  # ... (other aws_alb_listener_rule arguments) ...
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}
