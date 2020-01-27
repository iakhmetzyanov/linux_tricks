....
ENV JAVA_OPTS="-Dfile.encoding=UTF-8 -Duser.language=ru -Duser.region=RU \
              -Xms512m -Xmx8G -XX:MaxPermSize=512M \
              -javaagent:/jmx-exporter/jmx-exporter.jar=9001:/jmx-exporter/config.yaml"

ENV TZ='Europe/Moscow'
ENV LANG="ru_RU.UTF-8"

ENTRYPOINT tomcat/bin/catalina.sh start && tail -f tomcat/logs/catalina.out
