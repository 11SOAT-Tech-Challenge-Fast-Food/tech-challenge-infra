terraform {
  backend "remote" {
    organization = "fiap-pos-tc"

    workspaces {
      name = "core-infra"
    }
  }
}
