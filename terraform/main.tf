module "vault" {
  source = "./vault-init"
}

module "faas" {
  source = "./faas"
  vault_approle_id = "${module.vault.role_id[0]}"
  vault_approle_secret = "${module.vault.secret_id[0]}"
}

provider "nomad" {
  address = "http://localhost:4646"
}

provider "vault" {
  address = "http://localhost:8200"
  token = "${var.vault_token}"
}