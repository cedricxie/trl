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

# Reference: https://github.com/huggingface/trl/issues/401

# Stage 1
# python3 examples/research_projects/stack_llama/scripts/supervised_finetuning.py
# python3 examples/research_projects/stack_llama/scripts/merge_peft_adapter.py --adapter_model_name=trl-lib/llama-7b-se-peft --base_model_name=huggyllama/llama-7b --output_name=llama-7b-se

# Stage 2
# python3 examples/research_projects/stack_llama/scripts/reward_modeling.py
# python3 examples/research_projects/stack_llama/scripts/merge_peft_adapter.py --adapter_model_name=trl-lib/llama-7b-se-rm-peft --base_model_name=cedricxie/llama-7b-se --output_name=llama-7b-se-rm
