FROM tomcat:9

COPY target/eduardo_lpsw-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
