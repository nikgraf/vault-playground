backend "file" {
  path = "/<your_path_to_this_repository>/vault/storage"
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_cert_file = "/<your_path_to_this_repository>/vault/selfsigned.crt"
  tls_key_file = "/<your_path_to_this_repository>/vault/selfsigned.key"
}
