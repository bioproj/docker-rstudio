#!/bin/bash

## Download and install RStudio server & dependencies uses.
##
## In order of preference, first argument of the script, the RSTUDIO_VERSION variable.
## ex. stable, preview, daily, 1.3.959, 2021.09.1+372, 2021.09.1-372, 2022.06.0-daily+11

set -e

RSTUDIO_VERSION=${1:-${RSTUDIO_VERSION:-"stable"}}
DEFAULT_USER=${DEFAULT_USER:-"rstudio"}

# shellcheck source=/dev/null
source /etc/os-release

# a function to install apt packages only if they are not installed
# function apt_install() {
#     if ! dpkg -s "$@" >/dev/null 2>&1; then
#         if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
#             apt-get update
#         fi
#         apt-get install -y --no-install-recommends "$@"
#     fi
# }

# ARCH=$(dpkg --print-architecture)

# install s6 supervisor
/rocker_scripts/install_s6init.sh


# set up default user
/rocker_scripts/default_user.sh "${DEFAULT_USER}"

# install user config initiation script
cp /rocker_scripts/init_set_env.sh /etc/cont-init.d/01_set_env
cp /rocker_scripts/init_userconf.sh /etc/cont-init.d/02_userconf
# cp /rocker_scripts/pam-helper.sh /usr/lib/rstudio-server/bin/pam-helper

# Clean up
rm -rf /var/lib/apt/lists/*


