terraform {
  cloud {
    organization = "fiap-pos-tc"

    workspaces {
      name = "core-infra"
    }
  }
}