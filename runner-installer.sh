#!/bin/bash
# Variables
zip="actions-runner-linux-x64-2.294.0.tar.gz"
runner=".runner"
# Verify if a directory named "actions-runner" exist, if don't exist it create one
mkdir -p ~/actions-runner && cd ~/actions-runner
# Verify if the zip file exist, if don't exist it download
if [ ! -e $zip ]; then
    echo "Adding new runner..."
    curl -o $zip -L https://github.com/actions/runner/releases/download/v2.294.0/$zip
fi
tar xzf ./$zip
# Verify if a runner exist, if don't exist it create one
if [ ! -f $runner ]; then
    ./config.sh --unattended --url $1 --token $2 --name $3 --labels $4
fi
cd ~/actions-runner
sudo ./svc.sh install
sudo ./svc.sh start
echo "Service runner up"
