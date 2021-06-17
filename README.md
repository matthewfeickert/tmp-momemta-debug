# tmp-momemta-debug
Temporary repo for debugging MoMEMta simulation and reweighting process

> Remember to use `git clone --recursive` to get the submodule

## Running ttbar tutorial

To run the ttbar tutorial example from https://github.com/MoMEMta/Tutorials drop into an interactive session in the `neubauergroup/momemta-python-centos:latest` Docker container and then run the `run_ttbar_tutorial.sh` Bash script

```console
$ bash run_docker.sh
[docker@abc123456789 tmp-momemta-debug]$ bash run_ttbar_tutorial.sh
```

The weighted events file will be located at

```
Tutorials/build/tt_20evt_weights.root
```
