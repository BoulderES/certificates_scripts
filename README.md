# certificates_scripts

Dirty Scripts to create CAs and sign domain certificates

## Installation

Just download this [project](https://github.com/BoulderES/certificates_scripts) on the desired folder.

```bash
$ wget --no-check-certificate https://github.com/BoulderES/certificates_scripts/archive/master.tar.gz

$ tar -xzf ./master.tar.gz -C ./
```

## Usage

From the downloaded folder add execution permissions to files:

```bash
$ cd certificates_scripts-main 

$ chmod +x createCA.sh templates/sign_certificates_TEMPLATE.sh

```

### Certificate Authority Creation

Execute the script below and provide the requested information (dummy CA name and password):

```bash

$ ./createCA.sh
>> Enter CA name:
>> dummy.local
>> Enter the CA password:
>> xxxxx

```

The script execution creates a folder with the files within and using the same name provided as CA name. 

For this example the name used as CA is "dummy.local" so you will need to navigate to this folder in the next step.

IMPORTANT!!! The generated certificate (.crt file of the "dummy.local" folder) must be installed in the SO as Trusted Root Certification Authorities (machine level)

### Signing Request Creation and Signing Certificates

Once the CA has been created go to the desired folder and execute the script below and provide the requested information in order to create and sign the required certificates:

```bash
$ cd dummy.local/
$ ./sign_certificates.sh
>> !!!! you are going to sign the certificate with: *** dummy.local ***
>> Domain name to sign:
>> dummy.signed.local
>> Enter pass phrase for ../dummy.local.key
>> xxxxx
```

Each generated certificate generates its own folder with all the related files inside. For this example we used the domain "dummy.signed.local" so a folder with the same name will be created.  

### Folder Structure

As commented before, and in order to have all the files structured, these scripts will create the folder structure as follow:

```bash
├── README.md
├── createCA.sh
├── dummy.local
│         ├── dummy.local.crt
│         ├── dummy.local.key
│         ├── dummy.local.pem
│         ├── dummy.signed.local
│         │         ├── dummy.signed.local.crt
│         │         ├── dummy.signed.local.csr
│         │         ├── dummy.signed.local.ext
│         │         ├── dummy.signed.local.key
│         │         └── dummy.signed.local.pem
│         └── sign_certificates.sh
└── templates
          └── sign_certificates_TEMPLATE.sh
```


## Contributing
These scripts just provide an easy way to have a custom CA that allow us to sign as much certificates as needed to local development. Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)