
configfile: "config/config.yaml"

samples = config['sample_group'].values()

rule all:
    input:
        expand("results/{sample}.txt", sample=samples)

rule touch:
    output:
        "{sample}.txt"
    params:
        a = config["sample_group"]["key1"]
    run:
        cmd = "touch {output}"
        shell(cmd)