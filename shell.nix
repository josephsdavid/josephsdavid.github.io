let
    pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    name = "blogR";
    buildInputs = with pkgs; [
      vscode
      rPackages.prettydoc
      rPackages.tint
      rPackages.rmdformats
#       jupyterEnvironment
       python37
       python37Packages.pandas
       python37Packages.numpy
       python37Packages.matplotlib
       #python37Packages.sqlite
       python37Packages.notebook
       python37Packages.ipython
       python37Packages.jupytext
       python37Packages.scikitlearn
       python37Packages.seaborn
       python37Packages.scipy
       python37Packages.plotly
       python37Packages.ipywidgets
       python37Packages.future
       python37Packages.scikitimage
       #Todo Package graphlab
       python37Packages.tzlocal
       python37Packages.simplegeneric
       R
       rstudio
       rPackages.data_table
       rPackages.mlbench
       rPackages.lobstr
       rPackages.lubridate
       rPackages.stringr
       rPackages.abind
       rPackages.foreign
       rPackages.downloader
       rPackages.memoise
       rPackages.lattice
       rPackages.microbenchmark
       rPackages.arules
       rPackages.tidyverse
       rPackages.devtools
       rPackages.pander
       rPackages.Rcpp
       rPackages.RNHANES
       rPackages.reticulate
       python37Packages.pprintpp
       rPackages.blogdown
       hugo
    ];
    
  }
