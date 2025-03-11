# Use a base image with Java and Maven
FROM maven:3.8.4-openjdk-17-slim

# Copy the project files into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Build the Maven project
RUN mvn clean package -DskipTests

# Expose the port your application runs on
EXPOSE 8085

# Command to run the application
CMD ["java", "-jar", "target/DevOps_Lab_2-0.0.1-SNAPSHOT.jar"]