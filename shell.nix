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
      rPackages.neuralnet
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
      rPackages.iml
      rPackages.vip
      rPackages.devtools
      rPackages.pander
      rPackages.Rcpp
      rPackages.RNHANES
      rPackages.reticulate
      rPackages.blogdown
      rPackages.vars
      rPackages.RcppArmadillo
      rPackages.urca
      rPackages.reticulate
      rPackages.kknn
      rPackages.ranger
      rPackages.gbm
      rPackages.gganimate
      rPackages.transformr
      rPackages.randomForest
      rPackages.ggthemes
      python37
      python37Packages.pandas
      python37Packages.numpy
      python37Packages.scikitlearn
      python37Packages.scipy
      python37Packages.matplotlib
      python37Packages.seaborn
      python37Packages.pprintpp
      rPackages.magick
      hugo
    ];
    shellHook = ''
#     echo "#!/usr/bin/env Rscript" > libs.R
#     echo "devtools::install_github('csgillespie/efficient', build_vignettes=TRUE)" >> libs.R
#     Rscript libs.R
    '';
  }
