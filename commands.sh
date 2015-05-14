vault init -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200
# Key 1: f6b93db811e4ecf3b644c9873bda8dc5a2e7ac3752222a17251c36d8b9ea0b4a01
# Key 2: 4e2f20caf493983363fdf8431debd7b80a8746290a99c97d51633118b3763f4302
# Key 3: 8dbef9334912e5c73c40d3f131e89718d5ef7a7bd79a4f0dc1ece88cecd1432c03
# Key 4: 76ded8dff803625e367efdfd506da7eaf6d2a9700e84b59637918f63cd98113f04
# Key 5: b54f012645821faa69c3d64f7c6ee74a29ba9522d38733e6a71e56f7923f6d5005
# Initial Root Token: c6edc2e4-6131-54cd-fe8f-4decd4e4340a
#
# Vault initialized with 5 keys and a key threshold of 3!
#
# Please securely distribute the above keys. Whenever a Vault server
# is started, it must be unsealed with 3 (the threshold) of the
# keys above (any of the keys, as long as the total number equals
# the threshold).
#
# Vault does not store the original master key. If you lose the keys
# above such that you no longer have the minimum number (the
# threshold), then your Vault will not be able to be unsealed.

vault unseal -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200
# Key (will be hidden):
# Sealed: true
# Key Shares: 5
# Key Threshold: 3
# Unseal Progress: 1
vault unseal -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200
# Key (will be hidden):
# Sealed: true
# Key Shares: 5
# Key Threshold: 3
# Unseal Progress: 2
vault unseal -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200
# Key (will be hidden):
# Sealed: false
# Key Shares: 5
# Key Threshold: 3
# Unseal Progress: 0

vault auth -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 c6edc2e4-6131-54cd-fe8f-4decd4e4340a
# Successfully authenticated! The policies that are associated
# with this token are listed below:
#
# root

vault policy-write -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 applicationx-admin admin_policies.hcl
# Policy 'applicationx-admin' written.

vault policy-write -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 ci ci_policies.hcl
# Policy 'ci' written.

vault token-create -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 -display-name="ci" -policy="ci"
# efc420fc-df6d-4792-7f66-9f551f07c160

vault token-create -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 -display-name="applicationx-admin" -policy="applicationx-admin"
# 0f6dd60f-98ba-6eec-a37b-c41c378c0664

vault auth -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 0f6dd60f-98ba-6eec-a37b-c41c378c0664
# Successfully authenticated! The policies that are associated
# with this token are listed below:
#
# applicationx-admin

vault write -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 secret/applicationx/staging value=world
# Success! Data written to: secret/applicationx/staging

vault delete -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 secret/applicationx/staging/value
# Success! Deleted 'secret/applicationx/staging/value'

vault write -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 secret/applicationx/staging mandrill-api-token=52cd542
# Success! Data written to: secret/applicationx/staging

vault read -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 -format=json secret/applicationx/staging
# {
# 	"lease_id": "secret/applicationx/staging/580fa773-df87-1418-d163-dc4ce88a5048",
# 	"lease_duration": 2592000,
# 	"renewable": false,
# 	"data": {
# 		"mandrill-api-token": "52cd542"
# 	}
# }

vault auth -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 efc420fc-df6d-4792-7f66-9f551f07c160
# Successfully authenticated! The policies that are associated
# with this token are listed below:
#
# ci

vault read -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 -format=json secret/applicationx/staging
# {
# 	"lease_id": "secret/applicationx/staging/580fa773-df87-1418-d163-dc4ce88a5048",
# 	"lease_duration": 2592000,
# 	"renewable": false,
# 	"data": {
# 		"mandrill-api-token": "52cd542"
# 	}
# }

vault write -ca-path=/<your_path_to_this_repository>/vault/selfsigned.crt -address=https://127.0.0.1:8200 secret/applicationx/staging test=xyz
# Error writing data to secret/applicationx/staging: Error making API request.
#
# URL: PUT http://127.0.0.1:8200/v1/secret/applicationx/staging
# Code: 400. Errors:
#
# * permission denied
