#Launching JupyterLab #

**Step 1. Install  **
Guide: https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html
Example. Create a python virtual environment and install via pip
```
#Load the HPC installed python module
module load python/3.13.5
#Create a python enviornment in your working directory
python -m venv /mnt/lifesciences/pra-0066/users/$USER/jupyter_env
#Install JupyterLab
pip install jupyterlab

#Install ipykernal, allows you to use this python environment in the notebook
pip install ipykernel
#Activate
source /mnt/lifesciences/pra-0066/users/$USER/jupyter_env/bin/activate
```

** Step 2. Select an interactive allocation and start an interactive shell on a compute node **
#Salloc is a workload manager for slurm. Select an interactive allocation with your account and needs. 
salloc --account=pra-0070 --partition=lifesci --cpus-per-task=2 --mem=2G --time=1:00:00 
#Start an interactive shell and move from the head node to this compute node
srun --pty bash

** Step 3. Launch JupyterLab **
#Whilst in the interactive shell load python environment
source /mnt/lifesciences/pra-0066/users/$USER/jupyter_env/bin/activate
#launch jupyter lab 
jupyter lab --no-browser --ip=0.0.0.0 --port=8899

#Open a new terminal, create an ssh connection. Make sure to replace node-017 with the compute node name assigned, and make sure the port number matches what had been requested. 
ssh -N -L 8899:node-017:8899 $USER@anatra.bath.ac.uk
#Copy and paste the URL link into a browser e.g
http://127.0.0.1:8899/lab?token=55881e8a06bee0244e2ef958fde1c187f0c1ad45038430fc

