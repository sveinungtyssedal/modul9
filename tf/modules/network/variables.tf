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

