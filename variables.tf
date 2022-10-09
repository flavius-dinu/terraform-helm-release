variable "helm" {
  type = map(object({
    name             = string
    chart            = string
    repository       = optional(string, null)
    version          = optional(string, null)
    namespace        = optional(string, null)
    create_namespace = optional(bool, false)
    values           = optional(list(string), [])
    set = optional(list(object({
      name  = string
      value = string
      type  = optional(string, "auto")
    })), [])
    set_sensitive = optional(list(object({
      name  = string
      value = string
      type  = optional(string, "auto")
    })), [])
  }))
  description = "Helm release parameters"
  default     = {}
}
