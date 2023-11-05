

FROM tomcat:9

COPY target/*.war  eduardo_lpsw-1.war

EXPOSE 8080


