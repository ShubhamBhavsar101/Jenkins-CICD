# FROM maven:3.9.6-eclipse-temurin-17

# LABEL maintainer="Shubham Bhavsar"
# LABEL purpose="Java 17 + Maven + Docker CLI Agent for Jenkins Pipelines"

# # Install Docker CLI
# RUN apt-get update && \
#     apt-get install -y docker.io && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# # Create a script that fixes the Docker group inside container
# COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# # Default to root (since Jenkins Docker agent runs as root unless configured otherwise)
# USER root
# WORKDIR /usr/src/app

FROM maven:3.9.6-eclipse-temurin-17 AS builder

LABEL maintainer="Shubham Bhavsar"
LABEL purpose="Java 17 + Maven Docker Agent for Jenkins Pipelines"

# Optional: Install docker-cli if needed
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean


# Set work directory
USER root
WORKDIR /usr/src/app