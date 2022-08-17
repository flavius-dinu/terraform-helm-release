resource "helm_release" "this" {
  for_each         = var.helm
  name             = each.value.name
  chart            = each.value.chart
  repository       = lookup(each.value, "repository", null)
  version          = lookup(each.value, "version", null)
  namespace        = lookup(each.value, "namespace", null)
  create_namespace = lookup(each.value, "create_namespace", false) ? true : false

  values = [for yaml_file in lookup(each.value, "values", []) : file(yaml_file)]
  dynamic "set" {
    for_each = lookup(each.value, "set", [])
    content {
      name  = set.value.name
      value = set.value.value
      type  = lookup(set.value, "type", "auto")
    }
  }
  dynamic "set_sensitive" {
    for_each = lookup(each.value, "set_sensitive", [])
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
      type  = lookup(set_sensitive.value, "type", "auto")
    }
  }
}
