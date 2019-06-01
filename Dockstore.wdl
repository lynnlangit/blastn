task blastn {
   String path

   command {
      bash blast.sh ${path}
   }

   output {
      File bamstats_report = "out.txt"
   }

   runtime {
      docker: "registry.dockerhub.com/lynnlangit/blast:latest"
   }
}

workflow blastnWorkflow {
   String path
   call blastn {
      input: path=path
   }
}

