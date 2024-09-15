# Step 1: Use a base image with JDK installed
FROM openjdk:8-jdk-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the packaged JAR file from the host machine to the container
COPY target/hello-world-1.0-SNAPSHOT.jar /app/hello-world.jar

# Step 4: Define the command to run the JAR file
CMD ["java", "-jar", "hello-world.jar"]
