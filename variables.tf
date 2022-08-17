variable "helm" {
  type        = any
  description = <<-EOT
    name                   = string
    chart                  = string
    repository             = string
    version                = string
    repository             = string
    namespace              = string
    create_namespace       = bool
    values                 = list(string)
    set                    = list(object({
        name   = string
        value  = string
        type   = string
    }))
    set_sensitive          = list(object({
        name   = string
        value  = string
        type   = string
    }))
  EOT
}
