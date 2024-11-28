# Use an appropriate base image
FROM python:3.10

# Set working directory in the container
WORKDIR /app

# Copy and Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create a new Jupyter configuration file
ENV JUPYTER_NOTEBOOK_CONFIG="{'NotebookApp': {'password_required': False}}"

# Expose the port
EXPOSE 8888

# Run Jupyter Notebook when the container starts
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]