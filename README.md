# Containerised Environments for Data Science

A collection of containerised environments for data science and machine learning. Each environment is designed to be self-contained and reproducible.

For a detailed list of available environments and their included tools, see the [Container Index](container_index.md).

In this repository, you will find a collection of Dockerfiles and configuration scripts that can be used to build containers that have been used for Data Engineering, Data Science (including Machine Learning), and related projects. These environments leverage Docker, a popular tool for managing containers, to provide consistent behaviour across different deployment scenarios. Most of the containers are based on the Linux kernel and the packages are installed using `apt-get` and `pip`.



## Getting Started with Docker

Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications. It's a set of platform as a service (PaaS) products that uses OS-level virtualisation to deliver software in packages called containers. Containers include everything needed to run the application, such as the code, runtime, libraries, and configuration files. They can communicate with each other through defined channels, such as networking interfaces. Docker simplifies the deployment process and enhances scalability, making it a popular choice for modern application development and deployment.

Before using the scripts provided in this repository you will need Docker (or an alternative container runtime) on your host system. [Docker's website](https://www.docker.com/get-started/) has a guide for setting up Docker on various operating systems.



## Docker Commands

### Basic Commands and Options
```bash
# Building Images
docker build -t <image_name>_<tag> .     # Build from Dockerfile in current directory
  -t                                     # Tag the image with a name
  -f <Dockerfile>                        # Use a specific Dockerfile
  --no-cache                            # Build without using cache

# Running Containers
docker run <image_name>                  # Run a container
  -d                                    # Run in detached mode (background)
  -it                                   # Run interactively with terminal
  -v                                    # Mount a volume from host to container
  -p                                    # Map ports from host to container
  --rm                                  # Remove container when it exits

# Container Management
docker ps                               # List running containers
docker ps -a                            # List all containers (including stopped)
docker stop <container_id>              # Stop a container
docker rm <container_id>                # Remove a container
docker rmi <image_name>                 # Remove an image
docker images                           # List all images
docker pull <image_name>                # Pull image from Docker Hub
```

### Real-World Examples
1. Build an environment:
   ```bash
   docker build -t <container_name>:latest -f Dockerfile .
   ```

2. Run a container with port mapping:
   ```bash
   # Map container port 80 to host port 5000
   docker run --rm -p 5000:80 <container_name>
   ```

3. Stop all running containers:
   ```bash
   docker stop $(docker ps -aq)
   ```

4. Clean up your system (remove all containers and images):
   ```bash
   docker rm $(docker ps -aq)
   docker rmi $(docker images -q)
   ```

5. Run a container with mounted volumes and port mapping:
   ```bash
   docker run -p 8888:8888 \
     -v /home/user/data:/app/shared_working \
      <container_name>
   ```

### Advanced Examples

1. Run a Jupyter notebook server with data volumes (using data wrangling environment):
   ```bash
   docker run -d \
       --name <container_name>\
       -p 8888:8888 \
       -v $(pwd)/notebooks:/notebooks \
       -v $(pwd)/data:/data \
       <container_name>
   ```

2. Run with resource limits and environment variables (machine learning environment):
   ```bash
   docker run -d \
       --name  <container_name> \
       --gpus all \
       --memory="8g" \
       --cpus="4" \
       -e PYTHONPATH=/app \
       -v $(pwd):/app \
       -p 8888:8888 \
       -p 2222:22 \
       -v ~/.ssh/container_key.pub:/home/zeus/.ssh/authorized_keys \
       machine_learning_001
   ```
   Access Jupyter Lab at: http://localhost:8888/lab?token=abc123

   Note: The default Jupyter token is set to 'abc123'. You can change this by modifying the `--NotebookApp.token` parameter in `entrypoint.sh` if the container supports it.

### Additional Useful Commands
```bash
# Resource Management
docker run --memory="2g" <image>         # Limit memory to 2GB
docker run --cpus="1.5" <image>          # Limit CPU to 1.5 cores
docker run --gpus all <image>            # Give access to all GPUs

# Environment Variables
docker run -e VAR=value <image>          # Set environment variable
docker run --env-file=.env <image>       # Load environment from file

# Container Operations
docker logs <container_id>               # View container logs
docker exec -it <container_id> bash      # Get a shell in running container
docker cp <container_id>:/path/file .    # Copy files from container

# System Cleanup
docker container prune                   # Remove stopped containers
docker image prune                       # Remove unused images
docker system prune -a                   # Remove all unused resources
```

### Docker Maintenance

#### Clearing Docker Cache

To remove all unused Docker objects and free up disk space, use the following command:

```bash
docker system prune -a -f
```

This command will:
- Remove all stopped containers
- Delete all networks not used by at least one container
- Remove all images without an associated container
- Clear all build cache

**Caution**: This command permanently deletes Docker resources, so use it carefully to avoid removing important images or containers.

More information about Docker commands can be found in the [official Docker documentation](https://docs.docker.com/reference/cli/docker/).



## Container Access with SSH

### 1. SSH Key Setup
```bash
# Generate SSH key pair for container access
ssh-keygen -t rsa -b 4096 -f ~/.ssh/container_key -N ""

# Verify the key was created
ls -l ~/.ssh/container_key*
```

This creates:
- Private key: `~/.ssh/container_key`
- Public key: `~/.ssh/container_key.pub`

### 2. Container Setup
The container's Dockerfile is configured to:
- Create a non-root user `zeus`
- Set up SSH with security hardening
- Import your public key during container startup

### 3. Building and Running
```bash
# Build the container
docker build -t <container_name> .

# Run with SSH and JupyterLab access
docker run \
    -p 8888:8888 \
    -p 2222:22 \
    -v ~/.ssh/container_key.pub:/home/zeus/.ssh/authorized_keys \
    -v ~/data_science:/app/ \
    -d <container_name>

# Connect to container
ssh -i ~/.ssh/container_key -p 2222 zeus@localhost
```

The SSH configuration includes:
- Public key authentication only
- Root login disabled
- Fail2ban enabled
- Secure crypto settings



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
