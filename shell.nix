let
  pkgs = import <nixpkgs> {
    overlays = [
      (self: super: {
        bundler = super.bundler.overrideAttrs(old: {
          name="bundler-2.1.4";
          src = super.fetchurl {
            url = "https://rubygems.org/gems/bundler-2.1.4.gem";
            sha256= "12glbb1357x91fvd004jgkw7ihlkpc9dwr349pd7j83isqhls0ah";
          };
        });
      })
    ];
  };
in
  pkgs.mkShell {
    name = "blogR";
    buildInputs = with pkgs; [
      vscode
      bundler_HEAD
      ruby
      bundix
      gitAndTools.gitFull
      rubyPackages_2_6.jekyll
      jekyll
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
