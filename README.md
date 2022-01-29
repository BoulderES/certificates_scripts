# certificates_scripts

Dirty Scripts to create CAs and sign domain certificates

## Installation

Just download this [project](https://github.com/BoulderES/certificates_scripts) on the desired folder.

```bash
wget https://github.com/BoulderES/certificates_scripts/archive/refs/heads/main.zip

unzip certificates_scripts-main.zip
```

## Usage

From the downloaded folder add execution permissions to files:

```bash
cd certificates_scripts-main 

chmod +x createCA.sh templates/sign_certificates_TEMPLATE.sh

```

### Certificate Authority Creation

Execute the script below and provide the requested information (dummy CA name and password):

```bash

./createCA.sh

```

The script execution creates a folder with the files within and using the same name provided as CA name. 

For this example the name used as CA is "dummy.local" so you will need to navigate to this folder in the next step.

IMPORTANT!!! The generated certificate (.crt file of the "dummy.local" folder) must be installed in the SO as Trusted Root Certification Authorities (machine level)

### Create and sign a certificate

Once the CA has been created go to the desired folder and execute the script below and provide the requested information:

```bash

./sign_certificates.sh

```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)