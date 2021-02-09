// Location Name Variable
variable "location" {
    description = "Region where resources > provisioned"
    default = "UK South"
}

// Project Name
variable "project_name" {
    default = "task1b"
}

// VM Size
variable "vm_size" {
    default = "Standard_B1ms"
}
