# variable "project" {
#   type        = string
#   description = "Prefiks i ressursnavnene, f.eks. tim84-iac."

#   validation {
#     condition     = can(regex("^[a-z0-9-]{3,20}$", var.project))
#     error_message = "project kan bare inneholde små bokstaver, tall og bindestrek (3–20 tegn)."
#   }
# }

variable "project" {
  type        = string
  description = "Prefiks i ressursnavnene, f.eks. tim84-iac."

  validation {
    condition     = can(regex("^[a-z0-9-]{3,20}$", var.project))
    error_message = "project kan bare inneholde små bokstaver, tall og bindestrek (3–20 tegn)."
  }
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "ssh_source_prefix" {
  type        = string
  description = "Hvor SSH (port 22) er tillatt fra. Aldri \"*\"."
  default     = "VirtualNetwork" # Azure-tag: bare trafikk fra eget VNet
}
