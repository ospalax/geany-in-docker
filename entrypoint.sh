#!/bin/sh

#
# Copyright (2019) Petr Ospalý <petr@ospalax.cz>
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#
# initial config
#

if ! [ -d "${HOME}/.config/geany" ] ; then
    mkdir -p "${HOME}/.config/"
    echo "GEANY-IN-DOCKER: copying /opt/geany-config to ${HOME}/.config/geany"
    cp -rd /opt/geany-config "${HOME}/.config/geany"
fi

#
# template it
#

for i in \
    PROJECT_FILE_PATH \
    PREF_TEMPLATE_DEVELOPER \
    PREF_TEMPLATE_COMPANY \
    PREF_TEMPLATE_MAIL \
    PREF_TEMPLATE_INITIAL \
    PREF_TEMPLATE_VERSION \
    PREF_TEMPLATE_YEAR \
    PREF_TEMPLATE_DATE \
    PREF_TEMPLATE_DATETIME \
    ;
do
    _name=$(echo "$i" | tr '[:upper:]' '[:lower:]')
    _value=$(eval echo "\$${i}")
    echo "GEANY-IN-DOCKER: templating ${_name}='${_value}'"
    if [ -n "$_value" ] ; then
        sed -i "s#^\(${_name}\)=.*#\1=${_value}#" \
            "${HOME}/.config/geany/geany.conf"
    fi
done

#
# run geany in docker
#

exec geany "$@"
