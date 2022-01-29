#!/bin/bash
echo "Enter CA name:"
read caName
caName="${caName}CA"
if [ -d "$caName" ]; then
  # Take action if $DIR exists. #
  echo "${caName} CA name already exist... Please choose another or delete the existing files before proceed."
  exit 1
fi

echo "Enter the CA password:"
read -s password
mkdir $caName
cp ./templates/sign_certificates_TEMPLATE.sh $caName/sign_certificates.sh
cd $caName

openssl genrsa -aes256 -passout pass:$password -out $caName.key 2048
openssl req -x509 -new -nodes -key $caName.key -sha256 -days 10825 -passin pass:$password -subj "/C=ES/ST=Alicante/L=Alicante/O=$caName/OU=Devel, Inc./CN=$caName" -out $caName.pem


