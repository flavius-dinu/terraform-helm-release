provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "helm" {
  source = "../"
  helm = {
    argo = {
      name             = "argocd"
      repository       = "https://argoproj.github.io/argo-helm"
      chart            = "argo-cd"
      create_namespace = true
      namespace        = "argocd"
    }
  }
}
