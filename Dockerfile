

# Usa una imagen base de Tomcat
FROM tomcat:9

# Copia tu archivo WAR al directorio de despliegue de Tomcat
COPY target/eduardo_lpsw-1.war /usr/local/tomcat/webapps/

# Expone el puerto en el que Tomcat escucha (por defecto 8080)
EXPOSE 8080

# Puedes agregar cualquier configuración adicional o ajustes aquí si es necesario

# Comando para iniciar Tomcat
CMD ["catalina.sh", "run"]
