# Stage 1: Build the Java application using Maven
FROM maven:3.9.9-ibm-semeru-23-jammy AS builder

# Set the working directory for the Maven build
WORKDIR /app

# Copy the Maven project files into the container
COPY . .

# Run Maven to clean and package the application
RUN mvn clean package

# Stage 2: Deploy the .war file using Tomcat
FROM tomcat:latest

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Copy the .war file from the builder stage to Tomcat's webapps directory
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/

# Default command to run Tomcat
#CMD ["catalina.sh", "run"]
