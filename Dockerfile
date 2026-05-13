FROM ubuntu:24.04

LABEL maintainer="Drew Campbell" \
      description="Development container for TEMPO"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        make \
        cmake \
        make \
        g++ \
        git \
        gdb \
        vim \
        python3 \
        python3-pip \
        sudo \
        curl && \
    apt-get clean && \
    # Remove apt lists to reduce image size. This is recommended in Dockerfiles
    # that install packages to keep the resulting image smaller. It is not
    # strictly required, but omitting it will leave package cache files in the
    # image, increasing its size.
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/TEMPO

# Run the required scripts
RUN cd /workspace/TEMPO



CMD ["bash"]
