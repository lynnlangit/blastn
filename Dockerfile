# Set the base image to Ubuntu
FROM ubuntu:14.04

# Setup packages
#USER root
RUN apt-get -m update && apt-get install -y wget tar curl ncbi-blast+
COPY blastn.sh /

# get the tool and untar it to the local directory
# RUN curl -O https://s3.amazonaws.com/edamame/Blast_Tutorial.tar.gz
# RUN tar -zxvf Blast_Tutorial.tar.gz
# RUN cd Blast_Tutorial && \
#     echo "Making blast database" && \
#     makeblastdb -in rep_set.fna -dbtype nucl -out My16sAmplicon && \
#     blastn -db My16sAmplicon -query MyQuery.txt -out out.txt
