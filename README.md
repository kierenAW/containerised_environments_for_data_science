# Containerised Environments for Data Science

In this repository, you will find a collection of Dockerfiles and configuration scripts that can be used to build containers that have been used for Data Engineering, Data Science (including Machine Learning), and related projects. These environments leverage Docker, a popular tool for managing containers, to provide consistent behaviour across different deployment scenarios. Most of the containers are based on the Linux kernel and the packages are installed using `apt-get` and `pip`.



## Getting Started with Docker

Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications. It's a set of platform as a service (PaaS) products that uses OS-level virtualisation to deliver software in packages called containers. Containers include everything needed to run the application, such as the code, runtime, libraries, and configuration files. They can communicate with each other through defined channels, such as networking interfaces. Docker simplifies the deployment process and enhances scalability, making it a popular choice for modern application development and deployment.

Before using the scripts provided in this repository you will need Docker (or an alternative container runtime) on your host system. [Docker's website](https://www.docker.com/get-started/) has a guide for setting up Docker on various operating systems.



## Docker Commands

- `docker build -t <image name> .` : Build an image from the current directory's Dockerfile
 - `-t` tag the image with `<image name>`
 - `.` is used to indicate that the Dockerfile is in the current directory
 - `-f <Dockerfile>` can be used to specify a custom Dockerfile
 - `docker run <image name>`: Run an image.
 - `-v ` mount a volume from the host system into the container. This allows you to share files between the host and the container.
 - `docker ps`: List all running containers.
 - `docker stop <container id>`: Stop a container by its ID.
 - `docker rm <container id>`: Remove a container by its ID.
 - `docker rmi <image name>`: Remove an image by its name.
 - `docker images`: List all available images on the system.
 - `docker pull <image name>`: Pulls an image from Docker Hub.

Example usage of the commands above:
    1. Build an image named `my-app`: `docker build -t my-app .`
    2. Run a container `my-app` and map port 80 to 5000 in the container: `docker run --rm -p 5000:80 my-app`
    3. Stop all containers running on your system: `docker stop $(docker ps -aq)`
    4. Remove all containers and images from your system: `docker rm $(docker ps -aq); docker rmi $(docker images -q)`
    5. Run a container `my-app` and map port 8888 to 8888 in the container and also mount `/home/user/notebooks` in `/app/shared_working` on the container: `docker run -p 8888:8888 -v /home/user/notebooks:/app/shared_working my-app`

More information about Docker commands can be found [here](https://docs.docker.com/reference/cli/docker/).



## Naming Conventions
The naming convention for the containers is: `<task_name>_<version>` e.g. `data_wrangling_001`.
Container types are:
`data_wrangling` - Data wrangling containers that perform data retrieval, cleaning, transformation, or aggregation. These containers could be considered data engineering containers.
`machine_learning` - Machine Learning containers that train models and validate model performance.
`analysis_visualisation` - Analysis and visualisation containers that provide tools for descriptive data analysis and visualisation of data.
`app` - Application containers that run a specific application e.g. an MLFlow Server.



## Corrections and Improvements

If you find any corrections or improvements to the content of this page, please open a pull request on [GitHub](https://github.com/kierenAW/containerised_environments_for_data_science/pulls/).

As a general guide once an environment is created it is considered immutable. If you want to make changes to the environment, you should create another one to supersede the old one. This practice assists in reproducibility by keeping track of the history of the environment and its versions.


## Security and Vulnerabilities

Before using these scripts, it is recommended to thoroughly review the requirements and Docker files, checking for security issues in any packages or dependencies. If you find any issues or vulnerabilities, please open a pull request with the fix on [GitHub](https://github.com/kierenAW/containerised_environments_for_data_science/pulls).
