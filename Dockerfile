# Set the base image to Ubuntu
FROM ubuntu:14.04

# Setup packages
USER root
RUN apt-get -m update && apt-get install -y wget tar curl ncbi-blast+

# Get local blastn.sh file
COPY bin/blastn /usr/local/bin/
RUN chmod a+x /usr/local/bin/blastn

# switch back to the ubuntu user so this tool (and the files written) are not owned by root
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
USER ubuntu

# by default /bin/bash is executed
CMD ["/bin/bash"]

# get the tool and untar it to the local directory
# RUN curl -O https://s3.amazonaws.com/edamame/Blast_Tutorial.tar.gz
# RUN tar -zxvf Blast_Tutorial.tar.gz
# RUN cd Blast_Tutorial && \
#     echo "Making blast database" && \
#     makeblastdb -in rep_set.fna -dbtype nucl -out My16sAmplicon && \
#     blastn -db My16sAmplicon -query MyQuery.txt -out out.txt
