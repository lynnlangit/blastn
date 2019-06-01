task blastn {
   String path

   command {
      bash /usr/local/bin/blastn ${path}
   }

   output {
      File blastn_report = "out.txt"
   }

   runtime {
      docker: "lynnlangit/blastn:latest"
   }
}

workflow blastnWorkflow {
   String path
   call blastn {
      input: path=path
   }
}

