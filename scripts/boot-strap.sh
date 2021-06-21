#!/bin/bash



### Distro detect
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

### Docker install
chmod +x docker-install.sh
./docker-install.sh
rm -f get-docker.sh
### Three directory setup

mkdir -p /opt/project/zabbix-docker
cd /opt/project/zabbix-docker
mkdir -p zabbix-server/{externalscripts,alertscripts}

# Directories Grafana
mkdir -p grafana/{data,certs} && \
        chown -R 472:472 grafana && \
        chmod -R 775 grafana && \
        chown -R 472:472 grafana/certs