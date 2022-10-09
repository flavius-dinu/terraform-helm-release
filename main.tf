resource "helm_release" "this" {
  for_each         = var.helm
  name             = each.value.name
  chart            = each.value.chart
  repository       = each.value.repository
  version          = each.value.version
  namespace        = each.value.namespace
  create_namespace = each.value.create_namespace ? true : false

  values = [for yaml_file in each.value.values : file(yaml_file)]
  dynamic "set" {
    for_each = each.value.set
    content {
      name  = set.value.name
      value = set.value.value
      type  = set.value.type
    }
  }
  dynamic "set_sensitive" {
    for_each = each.value.set_sensitive
    content {
      name  = set_sensitive.value.name
      value = set_sensitive.value.value
      type  = set_sensitive.value.type
    }
  }
}
