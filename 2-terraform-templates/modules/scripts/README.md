## Enable virtual environment

    virtualenv -p python3.6 venv
    source venv/bin/activate


## Install dependencies

    pip3.6 install -r requirements.txt --target RenewLetsEncrypt


## Run Lambda function on local computer

    sam local invoke --profile stg "RenewLetsEncrypt" -e event.json


## Pack up

    zip -r9 RenewLetsEncrypt.zip RenewLetsEncrypt

