FROM rocker/verse:latest
RUN Rscript -e "install.packages(c('dataMaid', 'here', 'cowplot', 'docopt', 'GGally', 'ggpubr', 'ggthemes', 'janitor'))"
RUN Rscript -e "tinytex::install_tinytex()"