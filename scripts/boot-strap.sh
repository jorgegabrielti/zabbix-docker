#!/bin/bash

DISTRO=$(grep -Ei 'PRETTY_NAME' /etc/os-release | cut -d'=' -f2 | tr -d '"')

case ${DISTRO} in
    "Ubuntu 20.04.2 LTS")
        locale-gen pt_BR.UTF-8
        update-locale LANG=pt_BR.UTF-8
        apt install -y curl
    ;;
    "CentOS Stream 8")
        dnf install -y langpacks-en glibc-all-langpacks
        localectl set-locale LANG=pt_BR.UTF-8
        dnf install -y curl
    ;;
    "CentOS Linux 7 (Core)")
        yum install -y langpacks-en glibc-all-langpacks 
	localectl set-locale LANG=pt_BR.UTF-8
	yum install -y curl wget tcpdump net-tools
    ;;
    *)
        echo "Distro: [${DISTRO}] ==> Not supported!"
    ;;
esac
