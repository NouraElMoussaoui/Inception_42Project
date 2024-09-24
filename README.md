# Inception_42Project

## Project Overview

Inception is a project focused on expanding knowledge of system administration through the use of Docker. The goal of the project is to virtualize several Docker images, setting up a personal virtual machine that simulates real-world system environments. This project involves configuring and managing containers for various services, learning key aspects of containerization, and understanding Docker's role in modern system administration.

## Project Purpose

The Inception project is designed to help system administrators and developers:

- Gain a deeper understanding of Docker and container management.
- Learn to create and configure multiple Docker images and containers.
- Understand virtualization and resource optimization in a real-world system setup.
- Develop skills in network configuration, automation, and security using Docker.

## Technologies Used
- Docker: Containerization platform for creating, deploying, and managing applications.
- Docker Compose: Tool for defining and running multi-container Docker applications.
- Linux: The environment used to build and deploy Docker containers.
- Shell Scripting: For automating Docker setup and configuration.

## Services

This project includes the following Docker containers:

1- Nginx

- Acts as the web server to handle HTTP and HTTPS traffic.
- Built from a custom Dockerfile in requirements/nginx.
- Listens on port 443 for secure communication.
- Mounted to the WordPress volume for serving the website content.
- Depends on the WordPress container for site content.
  
2- MariaDB

- Database service using MariaDB, built from a custom Dockerfile in requirements/mariadb.
- Stores data persistently in the database volume, which is bound to /home/nel-mous/data/db.
- Exposes port 3306 for database connections.
- Environment variables for the database are loaded from the .env file.
  
3- WordPress

- Content management system (CMS) built from a custom Dockerfile in requirements/wordpress.
- Connects to MariaDB for managing site data.
- Mounted to the WordPress volume, bound to /home/nel-mous/data/wp to persist website data.
- Exposes port 9000 for interaction with the Nginx server.
Environment variables are loaded from the .env file.
