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
pip install wandb

huggingface-cli login
# https://github.com/cedricxie/lerobot/blob/main/env.sh
