# Author: Daredevils of Data Science
# Date: 2020-12-11

FROM rocker/verse:4.0.3

RUN Rscript -e "tinytex::install_tinytex(); tinytex::tlmgr_install(c('amsmath', 'caption'))"

RUN Rscript -e "install.packages(c('dataMaid', 'here', 'cowplot', 'docopt', 'GGally', 'ggpubr', 'ggthemes', 'janitor'), repos = 'https://mran.microsoft.com/snapshot/2020-12-08')"
