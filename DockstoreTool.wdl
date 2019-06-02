task blastn {
   String path

   command {
      bash /usr/local/bin/blastn-script ${path}
   }

   output {
      File blastn_report = "out.txt"
   }

   runtime {
      docker: "lynnlangit/blastn:latest"
   }
}

workflow blastnToolWorkflow {
   String path
   call blastn {
      input: path=path
   }
}

