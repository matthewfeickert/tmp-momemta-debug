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

## Running ttbar fully leptonic example from MoMEMta source

> Examples taken from https://github.com/MoMEMta/MoMEMta/tree/v1.0.1/examples


## Running broken attempt at Drell-Yan from scratch

> N.B.: This is broken code that is not supposed to work. It is for conceptual debugging.

Running the following will result in a core dump as the C++ and Lua files are not correct yet.
```console
$ bash run_docker.sh
[docker@abc123456789 tmp-momemta-debug]$ bash run_drell_yan_debug.sh
```
