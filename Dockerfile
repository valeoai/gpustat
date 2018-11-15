FROM docker as base

# Anaconda install
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh

RUN sh ./miniconda.sh -b -p ./miniconda

COPY gpustat ./gpustat
RUN ./miniconda/bin/pip install ./gpustat


FROM docker

COPY --from=base ./miniconda ./miniconda

ENTRYPOINT ["gpustat"]       