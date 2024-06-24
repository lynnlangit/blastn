# Set the base image to Ubuntu
FROM ubuntu:20.04

RUN apt-get -m update && apt-get install -y wget tar curl ncbi-blast+

# Get local blastn.sh file
COPY bin/blastn-script /usr/local/bin/
RUN chmod a+x /usr/local/bin/blastn-script

# by default /bin/bash is executed
CMD ["/bin/bash"]
