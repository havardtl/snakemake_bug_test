# snakemake_bug_test

Repository for reproducing bug in snakemake when running in folder with space. 

Operating system: WSL (Ubuntu 22.04.2 LTS) in Windows 11

Running ```snakemake --cores 1``` exits with error as it cannot find the config file. Complete log:

```
Building DAG of jobs...
Using shell: /usr/bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job stats:
job      count    min threads    max threads
-----  -------  -------------  -------------
all          1              1              1
touch        2              1              1
total        3              1              1

Select jobs to execute...

[Tue Jun  6 09:51:01 2023]
rule touch:
    output: results/value1.txt
    jobid: 1
    reason: Missing output files: results/value1.txt
    wildcards: sample=results/value1
    resources: tmpdir=/tmp

WorkflowError in file /mnt/c/Users/xxxxx/OneDrive - NTNU/snakemake_bug_test/Snakefile, line 2:
Workflow defines configfile config/config.yaml but it is not present or accessible (full checked path: /mnt/c/Users/xxxxx/OneDrive/config/config.yaml).
  File "/mnt/c/Users/xxxxx/OneDrive - NTNU/snakemake_bug_test/Snakefile", line 2, in <module>
Shutting down, this might take some time.
Exiting because a job execution failed. Look above for error message
Complete log: .snakemake/log/2023-06-06T095101.275967.snakemake.log
```

Snakemake finishes as expected in WSL when run in a path that does not contain a space. The bug is not present in miniconda terminal on windows 11, there it completes no matter if the path contains a space or not. 
