#!/bin/sh

#
# Copyright (2019) Petr Ospalý <petr@ospalax.cz>
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#
# personal preferences
#

PROJECT_FILE_PATH=${HOME}/Projekty
DEVELOPER="Petr Ospalý"
COMPANY=
EMAIL=petr@ospalax.cz
INITIAL=osp
VERSION_TEMPLATE=1.0
YEAR_TEMPLATE="%Y"
DATE_TEMPLATE="%Y-%m-%d"
DATETIME_TEMPLATE="%d.%m.%Y %H:%M:%S %Z"

#
# do not touch
#

XSOCK=/tmp/.X11-unix
DOCKER_IMAGE=geany-in-docker

docker run --rm -it \
    -v $XSOCK:$XSOCK \
    -e DISPLAY \
    -e PROJECT_FILE_PATH="$PROJECT_FILE_PATH" \
    -e PREF_TEMPLATE_DEVELOPER="$DEVELOPER" \
    -e PREF_TEMPLATE_COMPANY="$COMPANY" \
    -e PREF_TEMPLATE_MAIL="$EMAIL" \
    -e PREF_TEMPLATE_INITIAL="$INITIAL" \
    -e PREF_TEMPLATE_VERSION="$VERSION_TEMPLATE" \
    -e PREF_TEMPLATE_YEAR="$YEAR_TEMPLATE" \
    -e PREF_TEMPLATE_DATE="$DATE_TEMPLATE" \
    -e PREF_TEMPLATE_DATETIME="$DATETIME_TEMPLATE" \
    -u $(id -nu) \
    -v /usr/share/icons/:/usr/share/icons/:ro \
    -v /usr/share/themes/:/usr/share/themes/:ro \
    -v /usr/share/fonts/:/usr/share/fonts/:ro \
    -v "${HOME}/:/home/$(id -nu)/" \
    --name geany-in-docker \
    ${DOCKER_IMAGE} \
    "$@"
