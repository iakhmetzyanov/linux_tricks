#!/bin/bash
keytool=/opt/java7/bin/keytool
SERVERALIAS=project.Organisation.ru
ALIAS=project
KEYSTORE=keystore.jks
KEYSTORE2=keystore2.jks
STOREPASS=change_password
KEYPASS=$STOREPASS
CERTFILE=project.cer
CERTFILE2=project2.cer
#keytool -genkey -keyalg RSA -alias fcntp -keypass change_password -keystore keystore.jks -storepass change_password -validity 3600 -keysize 2048 \

$keytool -genkeypair -keyalg RSA \
-alias $SERVERALIAS -keystore $KEYSTORE \
-storepass $STOREPASS -validity 3600 -keysize 2048 \
-ext SAN="dns:machine_hostname" \
-dname "CN=$SERVERALIAS, OU=Engineering, O=Organisation, L=Tver S=City C=$SERVERALIAS"

$keytool -genkeypair -keyalg RSA \
-alias $ALIAS -keystore $KEYSTORE2 \
-storepass $STOREPASS -validity 3600 -keysize 2048 \
-ext SAN="dns:machine_hostname" \
-dname "CN=$ALIAS, OU=Engineering, O=Organisation, L=City S=City C=RU"


$keytool -export -alias $ALIAS -file $CERTFILE \
-keypass $KEYPASS -storepass $STOREPASS -keystore $KEYSTORE2

#keytool -export -alias fcntp -file casfcntp.cer -keypass change_password -keystore keystore.jks -storepass change_password

$keytool -import -alias $ALIAS -file $CERTFILE \
-keypass $KEYPASS -storepass $STOREPASS -keystore $KEYSTORE

$keytool -list -keystore $KEYSTORE -keypass $KEYPASS -storepass $STOREPASS


