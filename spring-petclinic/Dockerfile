FROM eclipse-temurin:8-jdk

# Setting up the working directory
WORKDIR /app

COPY *.jar spring-petclinic.jar

# Exposing the port on which the application will run
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "spring-petclinic.jar"]

