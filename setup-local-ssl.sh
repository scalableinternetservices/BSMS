#!/bin/bash
name=localhost.$(whoami)
cat > ssl.cnf << EOF
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
CN = $name
[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = $name
DNS.2 = *.$name
EOF
openssl req -new -newkey rsa:2048 -sha256 -days 3650 -nodes -x509 -keyout $name.key -out $name.crt -config ssl.cnf
mkdir -p config/ssl
mv $name.key $name.crt ssl.cnf config/ssl
openssl req -key config/ssl/$name.key -x509 -nodes -new -out config/ssl/$name.crt -subj /CN=localhost -reqexts SAN -extensions SAN -config <(cat /System/Library/OpenSSL/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:localhost")) -sha256 -days 3650
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain config/ssl/$name.crt
echo -e "Use the following command to start a Rails server with SSL: \nrails s -b 'ssl://127.0.0.1:3000?key=config/ssl/$name.key&cert=config/ssl/$name.crt'"


