#!/bin/bash
caNameFromFolder=${PWD/*\//}
echo "!!!! you are going to sign the certificate with: *** $caNameFromFolder *** "
echo "Domain name to sign:"
read DOMAIN
echo "Enter pass phrase for ../$caNameFromFolder.key"
read -s password
mkdir $DOMAIN
cd $DOMAIN

# Generate Key
openssl genrsa -out $DOMAIN.key 4096
# Sign Request
openssl req -new -sha256 -key $DOMAIN.key -subj "/C=ES/ST=Alicante/L=Alicante/O=$DOMAIN, Inc./OU=Devel/CN=$DOMAIN" -out $DOMAIN.csr;
# Populate with DNS
cat > $DOMAIN.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
EOF
# Sign certificate
openssl x509 -req -in $DOMAIN.csr -CA ../$caNameFromFolder.pem -CAkey ../$caNameFromFolder.key -CAcreateserial -passin pass:$password -out $DOMAIN.crt -days 825 -sha256 -extfile $DOMAIN.ext
cat $DOMAIN.crt $DOMAIN.key > $DOMAIN.pem
