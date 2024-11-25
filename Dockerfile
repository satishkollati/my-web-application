# Deploy the .war file using Tomcat
FROM tomcat:latest
# Expose the default Tomcat port (8080)
EXPOSE 8080
# Copy the .war file to Tomcat's webapps directory
COPY target/*.war /usr/local/tomcat/webapps/

# Default command to run Tomcat
#CMD ["catalina.sh", "run"]
