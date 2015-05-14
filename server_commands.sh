# Create TLS certificate - originally tried
# http://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl
# openssl req -subj '/CN=*/' -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days XXX -nodes

curl -O https://raw.githubusercontent.com/driskell/log-courier/develop/src/lc-tlscert/lc-tlscert.go
go build lc-tlscert.go

# Use 127.0.0.1 when the script asks you for an IP
./lc-tlscert
# Specify the Common Name for the certificate. The common name
# can be anything, but is usually set to the server's primary
# DNS name. Even if you plan to connect via IP address you
# should specify the DNS name here.
#
# Common name:
#
# The next step is to add any additional DNS names and IP
# addresses that clients may use to connect to the server. If
# you plan to connect to the server via IP address and not DNS
# then you must specify those IP addresses here.
# When you are finished, just press enter.
#
# DNS or IP address 1: 127.0.0.1
# DNS or IP address 2:
#
# How long should the certificate be valid for? A year (365
# days) is usual but requires the certificate to be regenerated
# within a year or the certificate will cease working.
#
# Number of days: 365
# Common name:
# DNS SANs:
#     None
# IP SANs:
#     127.0.0.1
#
# The certificate can now be generated
# Press any key to begin generating the self-signed certificate.
#
# Successfully generated certificate
#     Certificate: selfsigned.crt
#     Private Key: selfsigned.key
#
# Copy and paste the following into your Log Courier
# configuration, adjusting paths as necessary:
#     "transport": "tls",
#     "ssl ca":    "path/to/selfsigned.crt",
#
# Copy and paste the following into your LogStash configuration,
# adjusting paths as necessary:
#     ssl_certificate => "path/to/selfsigned.crt",
#     ssl_key         => "path/to/selfsigned.key",

vault server -config=./server_config.hcl
# ==> WARNING: mlock not supported on this system!
#
#   The `mlock` syscall to prevent memory from being swapped to
#   disk is not supported on this system. Enabling mlock or
#   running Vault on a system with mlock is much more secure.
#
# ==> Vault server configuration:
#
#          Log Level: info
#              Mlock: supported: false, enabled: true
#            Backend: file
#         Listener 1: tcp (addr: "127.0.0.1:8200", tls: "enabled")
#
# ==> Vault server started! Log data will stream in below:
