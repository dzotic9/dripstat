#!/bin/bash
APP_NAME=${1};
LICENSE=${2};
TYPE=${3};
NODE_TYPE=${4}
CONF_PROPERTIES="https://raw.githubusercontent.com/jelastic-jps/dripstat/master/configs/config.properties";
JAR_FILE="https://raw.githubusercontent.com/jelastic-jps/dripstat/master/scripts/dripstat.jar";

installDripstat(){
    rm -rf ${CONF_PATH}/dripstat
    mkdir ${CONF_PATH}/dripstat
    curl -sSf ${CONF_PROPERTIES} -o ${CONF_PATH}/dripstat/config.properties
    curl -sSf ${JAR_FILE} -o ${CONF_PATH}/dripstat/dripstat.jar
    sed -i 's|appName=.s*|appName='${APP_NAME}'|g' ${CONF_PATH}/dripstat/config.properties
    sed -i 's|licenseKey=.s*|licenseKey='${LICENSE}'|g' ${CONF_PATH}/dripstat/config.properties
}

if [ "${TYPE}" == "DOCKERIZED" ]
then
#echo "${NODE_TYPE}" >> /opt/tomcat/logs/dripstat.log
    if [[ "${NODE_TYPE}" == *"tomee"* || "${NODE_TYPE}" == *"tomcat"* ]]
    then
        echo 2 >> /opt/tomcat/logs/dripstat.log
        CONF_PATH="/opt/tomcat/lib"
        VARIABLES="/opt/tomcat/conf/variables.conf"
        grep -q dripstat.jar ${VARIABLES} && sed -ri "/dripstat.jar/d" ${VARIABLES} && echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES} || echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES}
        installDripstat;
        exit 0;
        
    elif [[ "${NODE_TYPE}" == *"glassfish"* ]]
    then
        CONF_PATH="/opt/glassfish/glassfish/lib"
        VARIABLES="/opt/glassfish/glassfish/domains/domain1/config/variables.conf"
        grep -q dripstat.jar ${VARIABLES} && sed -ri "/dripstat.jar/d" ${VARIABLES} && echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES} || echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES}
        installDripstat;
        exit 0;
    fi

elif [ $(hostname | grep -i jboss) ]  || [ $(hostname | grep -i wildfly) ]
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
    CONF_PATH=${5}
    installDripstat;
    VARIABLES=${6}"/variables.conf"
    grep -q dripstat.jar ${VARIABLES} && sed -ri "/dripstat.jar/d" ${VARIABLES} && echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES} || echo "-javaagent:${CONF_PATH}/dripstat/dripstat.jar" >> ${VARIABLES}

fi
 
