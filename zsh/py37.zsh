
if [ $? -eq 0 ]; then
    emulate bash -c '. /opt/miniconda3/etc/profile.d/conda.sh'
    conda activate python37
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        emulate bash -c '. /opt/miniconda3/etc/profile.d/conda.sh'
        CONDA_CHANGEPS1=false conda activate base
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi

