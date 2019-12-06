let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    name = "blogR";
    buildInputs = with pkgs; [
      vscode
      rPackages.prettydoc
      rPackages.formatR
      rPackages.tswge
      rPackages.vars
      rPackages.ggplot2
      rPackages.ggthemes
      rPackages.cowplot
      rPackages.functional
      rPackages.tint
      rPackages.rmdformats
      rPackages.pipeR
      rPackages.forecast
      R
      rstudio
      rPackages.imputeTS
      rPackages.data_table
      rPackages.tint
      rPackages.rmdformats
      rPackages.mlbench
      rPackages.lubridate
      rPackages.stringr
      rPackages.abind
      rPackages.foreign
      rPackages.downloader
      rPackages.memoise
      rPackages.lattice
      rPackages.microbenchmark
      rPackages.tidyverse
      rPackages.devtools
      rPackages.pander
      rPackages.Rcpp
      rPackages.RNHANES
      rPackages.reticulate
      rPackages.blogdown
      rPackages.vars
      rPackages.RcppArmadillo
      rPackages.urca
      hugo
    ];
    shellHook = ''
#     echo "#!/usr/bin/env Rscript" > libs.R
#     echo "devtools::install_github('csgillespie/efficient', build_vignettes=TRUE)" >> libs.R
#     Rscript libs.R
    '';
  }
