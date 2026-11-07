variable "student_id" {
  description = "Din unike student-ID. Brukes som prefiks i alle ressursnavn."
  type        = string
  default     = "042"
  # Ingen default – dette MÅ settes bevisst av hver enkelt student

  validation {
    condition     = can(regex("^[a-z0-9]{3,8}$", var.student_id))
    error_message = "student_id må være 3-8 tegn og kun inneholde små bokstaver og tall."
  }
}

variable "project" {
  description = "Kort prosjektnavn brukt i ressursnavn"
  type        = string
  default     = "iac"

  validation {
    condition     = length(var.project) <= 20
    error_message = "Prosjektnavnet kan ikke være lengre enn 10 tegn."
  }
}

variable "location" {
  description = "Azure-region for ressursene"
  type        = string
  default     = "westeurope" # eller overstyr i terraform.tfvars
}


# variable "ssh_public_key" {
#   description = "Offentlig SSH-nøkkel for admin-brukeren på VM-en"
#   type        = string
#   # Ikke sensitive: en offentlig nøkkel er ikke en hemmelighet
# }

variable "nsg_rules" {
  description = "Innkommende regler NSG-en skal generere"
  type = list(object({
    name     = string
    priority = number
    port     = string
    }
    )
  )
  default = [
    { name = "allow_ssh", priority = 100, port = "22" },
  ]
}

variable "my_ip" {
  description = "Din nåværende IP-adresse. Brukes for å begrense SSH-tilgang til VM-en."
  type        = string
  default     = "82.164.75.32"
}
# variable "resource_group_name" {
#   type = string
# }