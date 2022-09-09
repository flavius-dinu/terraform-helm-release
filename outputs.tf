# outputs
output "helm_metadata" {
  value = { for release in helm_release.this : release.name => release.metadata }
}
