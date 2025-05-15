#!/bin/bash
set -e

# Env Setup.
apt install python3.10-venv
python3.10 -m venv ".venv"
source .venv/bin/activate

echo "##############################"
python --version
echo "##############################"

pip install -e .[dev]
pip install wandb evaluate

git config --global user.email "cedricxie@gmail.com"
git config --global user.name "Yuesong.xie"

huggingface-cli login
