path=$1
echo $path
curl -O ${path}
tar -zxvf ${path##*/}
filename=$(basename -- "$path")
filename="${filename%%.*}"
cd $filename && \
   makeblastdb -in rep_set.fna -dbtype nucl -out My16sAmplicon && \
   blastn -db My16sAmplicon -query MyQuery.txt -out out.txt
cat out.txt
