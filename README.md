# explorer-v2-devops
Explorer v2 repo for deployment of the explorer v2 with configuration and encrypted credentials

## install ansible
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

## install ansible roles
```bash
ansible-galaxy install -r requirements.yml
```

## setup vault pass
edit `.vaultpass` file. Ask Soph for the pass and uncomment the line in ansible.cfg for local deployment

## edit hosts file in vault
```bash
ansible-vault edit hosts
```

## setup aws environment for credential encrypting
Place your aws access key to ~/.aws/credentials file, ie:
```
[default]
aws_access_key_id = <Access key ID obtained from previous step>
aws_secret_access_key = <Secret access key obtained from previ
```

Place your region aws config where your KMS key-pairs reside in to ~/.aws/config file, ie:
```
[default]
region = <Your aws region, e.g., us-west-1>
```

Locate your key id (ie xxx88x88-8888-xxxx-xxx8-8xx8x888x88xx) and encrypt it

```
keyid=xxx88x88-8888-xxxx-xxx8-8xx8x888x88xx
sourcefile=yoursourcefile
encryptedfile=yourencryptedoutputfile

aws kms encrypt --key-id ${keyid} \
	--plaintext "fileb://${sourcefile}" --query CiphertextBlob \
	--output text | base64 -d > ./${encryptedfile}
```

Decrypt and verify it matches the source file:
```
aws kms decrypt --key-id ${keyid} \
    --ciphertext-blob fileb://${encryptedfile} \
    --output text --query Plaintext | base64 -d
```

## install the backend indexer and api 
bash script/install-backend.sh

## update backend indexer and api
bash script/update-backend.sh
