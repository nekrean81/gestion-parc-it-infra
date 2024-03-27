terraform {

required_providers {

azurerm = {

source = "hashicorp/azurerm"

version = "~> 3.0.0"

}

}

required_version = ">= 0.14.9"

}

provider "azurerm" {

features {}

}



# The following example shows how to generate a random priority
# between 1 and 50000 for a aws_alb_listener_rule resource:

resource "random_integer" "priority" {
  min = 1
  max = 50000
}


resource "azurerm_resource_group" "rg" {
  name     = "rg-bruce-${random_integer.priority.result}"
  location = "West Europe"
}
