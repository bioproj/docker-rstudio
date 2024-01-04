# FROM ubuntu

# COPY /scripts/init_userconf.sh /etc/cont-init.d/init_userconf.sh 
# RUN /etc/cont-init.d/init_userconf.sh  abc


FROM ubuntu:jammy

# LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
#       org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
#       org.opencontainers.image.vendor="Rocker Project" \
#       org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

# ENV R_VERSION=4.3.2
# ENV R_HOME=/usr/local/lib/R
# ENV TZ=Etc/UTC

# COPY scripts/install_R_source.sh /rocker_scripts/install_R_source.sh

# RUN /rocker_scripts/install_R_source.sh

# ENV CRAN=https://p3m.dev/cran/__linux__/jammy/latest
# ENV LANG=en_US.UTF-8

COPY scripts /rocker_scripts

# RUN /rocker_scripts/setup_R.sh

# CMD ["R"]

RUN  /rocker_scripts/install_python_jupyter.sh

# FROM rocker/r-ver:4.3.0

# LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
#       org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
#       org.opencontainers.image.vendor="Rocker Project" \
#       org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

# ENV S6_VERSION=v2.1.0.2
# ENV RSTUDIO_VERSION=2023.06.0+421
# ENV DEFAULT_USER=rstudio
# ENV PANDOC_VERSION=default
# ENV QUARTO_VERSION=default

# RUN /rocker_scripts/install_rstudio.sh
# RUN /rocker_scripts/install_pandoc.sh
# RUN /rocker_scripts/install_quarto.sh

# EXPOSE 8787

# CMD ["/init"]


