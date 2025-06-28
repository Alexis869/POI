variable "project_id" {
  description = "ID du projet GCP"
  type        = string
  default = "projetinnovation"
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "Zone GCP"
  type        = string
  default     = "europe-west3-b"
}

variable "instance_name" {
  description = "Nom de l'instance"
  type        = string
  default     = "vm-minecraft"
}

variable "machine_type" {
  description = "Type de machine"
  type        = string
  default     = "e2-medium"
}

variable "image_project" {
  description = "Projet contenant l'image packer"
  type        = string
  default = "projetinnovation"
}

variable "image_name" {
  description = "Nom de l'image packer"
  type        = string
  default = "debian-12"
}
