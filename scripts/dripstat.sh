#!/bin/bash
APP_NAME=${1};
LICENSE=${2};
CONF_PROPERTIES="https://download.jelastic.com/public.php?service=files&t=dbdf9ec6db609a296d5e3b9246fefd95&download";
JAR_FILE="https://download.jelastic.com/public.php?service=files&t=f7edeccab89a4429858945740f740061&download";

installDripstat(){
    rm -rf ${CONF_PATH}/dripstat
    mkdir ${CONF_PATH}/dripstat
    curl -sSf ${CONF_PROPERTIES} -o ${CONF_PATH}/dripstat/config.properties
    curl -sSf ${JAR_FILE} -o ${CONF_PATH}/dripstat/dripstat.jar
    sed -i 's|appName=.s*|appName='${APP_NAME}'|g' ${CONF_PATH}/dripstat/config.properties
    sed -i 's|licenseKey=.s*|licenseKey='${LICENSE}'|g' ${CONF_PATH}/dripstat/config.properties
}

if [ $(hostname | grep -i jboss) ]  || [ $(hostname | grep -i wildfly) ]
then
    CONF_PATH="/opt/shared/modules"
    grep -q dripstat.jar /opt/shared/bin/standalone.conf || sed -i "s|jelastic-gc-agent.jar|jelastic-gc-agent.jar -javaagent:"${CONF_PATH}"/dripstat/dripstat.jar|g" /opt/shared/bin/standalone.conf
    installDripstat;
    
elif [ $(hostname | grep -i glassfish3) ]
then
    CONF_PATH="/opt/glassfish3/glassfish/lib"
    DOMAIN_XML="/opt/glassfish3/glassfish/domains/domain1/config/domain.xml"
    grep -q dripstat.jar ${DOMAIN_XML} || sed -i "s|jelastic-gc-agent.jar</jvm-options>|jelastic-gc-agent.jar</jvm-options><jvm-options>-javaagent:"${CONF_PATH}"/dripstat/dripstat.jar</jvm-options>|g" ${DOMAIN_XML}
    installDripstat;
    
elif [ $(hostname | grep -i glassfish4) ]
then
    CONF_PATH="/opt/shared/glassfish/lib"
    DOMAIN_XML="/opt/shared/glassfish/domains/domain1/config/domain.xml"
    grep -q dripstat.jar ${DOMAIN_XML} || sed -i "s|</java-config>|<jvm-options>-javaagent:/opt/shared/glassfish/lib/dripstat/dripstat.jar</jvm-options></java-config>|g" ${DOMAIN_XML}
    installDripstat;

elif [ $(grep -i cartridge /etc/jelastic/metainf.conf) ]
then
    cd /var/lib/jelastic/keys/
    CONF_PATH=$(find /opt/shared/ -name lib | head  -n 1)
    installDripstat;
    VARIABLES=$(find /opt/shared/ -name variables.conf | head  -n 1)
    grep -q dripstat.jar ${VARIABLES} && sed -ri "/dripstat.jar/d" ${VARIABLES} && echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES} || echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES}

else
    cd /var/lib/jelastic/keys/
    CONF_PATH=${3}
    installDripstat;
    VARIABLES=${4}"/variables.conf"
    grep -q dripstat.jar ${VARIABLES} && sed -ri "/dripstat.jar/d" ${VARIABLES} && echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES} || echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES}

fi
 
