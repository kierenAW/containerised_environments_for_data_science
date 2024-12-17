## Data Wrangling

### data_wrangling_001

A data engineering environment with JupyterLab that includes various tools for working with data. The container starts with JupyterLab running for immediate access.

**Directory:** [/data_wrangling/data_wrangling_001](/data_wrangling/data_wrangling_001)

#### Included Tools:
- **Data Collection:**
  - `beautifulsoup4`
  - `yfinance`
  - `Quandl`
  - `newspaper4k`
  - `alpha-vantage`

- **Data Processing:**
  - `numpy`
  - `pandas`
  - `dask`
  - `matplotlib`

- **Storage & Formats:**
  - `sqlite3`
  - `fastparquet`
  - `deltalake`

Note: All packages are maintained at recent versions (as of Nov 2024).


### data_wrangling_002

This container extends the data_wrangling_001 image by adding SSH access for remote development, making it easier to access and work with the data science tools and packages included. The container provides both web-based JupyterLab and SSH connectivity, with a simpler less secure configuration than future versions will provide.

**Directory:** [/data_wrangling/data_wrangling_002](/data_wrangling/data_wrangling_002)

#### Features:
- All features from data_wrangling_001
- SSH access for remote development
- JupyterLab interface


### data_wrangling_003

This container is an enhanced version of data_wrangling_002 with a comprehensive set of data science packages and improved security features. It provides both JupyterLab and SSH access, with packages organized into logical categories for better maintainability.

**Directory:** [/data_wrangling/data_wrangling_003](/data_wrangling/data_wrangling_003)

#### Features:
- Extended from data_wrangling_002
- Enhanced security configuration
- Organized package structure
- Pinned package versions (as of Dec 2024)

#### Package Categories:
- **Core Data Science and Analysis:**
  - `numpy`
  - `pandas`
  - `scipy`
  - `statsmodels`

- **Data Visualization:**
  - `matplotlib`
  - `seaborn`
  - `plotly`
  - `bokeh`

- **Jupyter and IDE Tools:**
  - `jupyterlab`
  - `jupyter-server`
  - `ipywidgets`
  - `ipykernel`

- **Data Storage and Processing:**
  - `sqlite3`
  - `sqlalchemy`
  - `dask`
  - `pyarrow`
  - `fastparquet`

- **Machine Learning and Stats:**
  - `scikit-learn`
  - `scikit-image`
  - `statsmodels`
  - `category_encoders`

- **Web and API:**
  - `requests`
  - `aiohttp`
  - `fastapi`
  - `httpx`

- **Image Processing:**
  - `Pillow`
  - `opencv-python`
  - `scikit-image`

- **Financial Data Tools:**
  - `yfinance`
  - `pandas-datareader`
  - `alpha_vantage`

- **Text Processing and NLP:**
  - `nltk`
  - `beautifulsoup4`
  - `lxml`

- **Development Tools:**
  - `black`
  - `flake8`
  - `pytest`
  - `mypy`


### data_wrangling_004

This container is built on the latest Ubuntu Noble Numbat (24.04 LTS) base image. Ubuntu Noble offers Long-term support until 2029

This container builds upon data_wrangling_003 package wise, focusing on advanced data profiling, validation, and interactive exploration. It introduces sophisticated tools for comprehensive data analysis and quality assurance.

**Directory:** [/data_wrangling/data_wrangling_004](/data_wrangling/data_wrangling_004)

#### Features:
- Extended from data_wrangling_003
- Advanced data profiling capabilities
- Interactive data exploration
- Statistical data validation
- Comprehensive data quality tools

#### Unique Package Additions:
- **Data Profiling and Validation:**
  - `ydata-profiling`: Advanced exploratory data analysis
  - `pandera`: Statistical data validation for pandas
  - `dtale`: Interactive pandas DataFrame exploration

#### Package Categories:
- **Core Data Science and Analysis:**
  - `numpy`
  - `pandas`
  - `scipy`
  - `scikit-learn`
  - `ydata-profiling`
  - `pandera`
  - `dtale`

Note: All packages are fixed at recent versions as of Dec 2024.


## Machine Learning

### machine_learning_001

A machine learning environment with JupyterLab that includes various tools for developing, training and testing machine learning models, with support for Large Language Models (LLMs). The container starts with JupyterLab running for immediate access and provides SSH access using a key. A static Jupyter token is also configurable at build time. This environment is built for CPU usage, ensuring wide compatibility across different systems, but does not include GPU acceleration.

**Directory:** [/machine_learning/machine_learning_001](/machine_learning/machine_learning_001)

#### Included Tools:
- **Core Libraries:**
  - `numpy`
  - `pandas`
  - `scipy`
  - `scikit-learn`
  - `scikit-image`
  - `dask` (with complete dependencies)
  - `distributed`

- **Deep Learning & LLMs:**
  - `torch`
  - `torchvision`
  - `torchaudio`
  - `transformers`
  - `accelerate`
  - `kornia`
  - `bitsandbytes`
  - `peft`
  - `tokenizers`
  - `sentencepiece`

- **Model Deployment:**
  - `onnx`
  - `onnxruntime`
  - `onnx2torch`
  - `einops`

- **ML Ops:**
  - `mlflow`
  - `optuna`
  - `wandb`
  - `webdataset`
  - `ax-platform`

- **Data & Evaluation:**
  - `datasets`
  - `evaluate`
  - `rouge_score`
  - `sacrebleu`
  - `nltk`
  - `pyarrow`
  - `fastparquet`
  - `pandas-profiling`
  - `xlrd`
  - `sqlite3`

- **Visualization:**
  - `matplotlib`
  - `seaborn`
  - `plotly`
  - `graphviz`

Note: All packages are maintained at recent versions (as of Nov 2024).


### machine_learning_002

An enhanced version of machine_learning_001 with CUDA support for GPU acceleration. This container is built on the NVIDIA CUDA base image (cuda:12.1.0-base-ubuntu22.04) and includes all the machine learning tools from machine_learning_001, optimized for GPU usage. The container provides both JupyterLab and SSH access, making it suitable for both interactive development and production deployments.

**Directory:** [/machine_learning/machine_learning_002](/machine_learning/machine_learning_002)

#### Features:
- All features from machine_learning_001
- NVIDIA CUDA 12.1 support for GPU acceleration
- GPU-optimized PyTorch and related libraries
- SSH access for remote development
- JupyterLab interface

#### Additional GPU-Specific Tools:
- NVIDIA CUDA Toolkit 12.1
- GPU-enabled PyTorch 2.1.0
- CUDA-optimized deep learning libraries

Note: This container requires a compatible NVIDIA GPU and appropriate NVIDIA drivers installed on the host system. Use the `--gpus all` flag when running the container to enable GPU access.

## Apps

### system_monitor_001

A comprehensive system monitoring application designed to provide real-time insights into host system resources.

**Directory:** [/apps/system_monitor_001](/apps/system_monitor_001)

#### Key Features
- Real-time monitoring of host system resources
- Detailed CPU usage tracking
  - Total CPU usage
  - Individual core usage
  - Load average history
- Comprehensive memory monitoring
  - Total, used, and available memory
  - Buffers and cached memory tracking
  - Swap space utilization
- GPU monitoring (when available)
  - GPU utilization
  - GPU memory usage
  - GPU temperature
  - **New: GPU temperature history chart**

#### Technical Highlights
- Built with Flask backend
- Chart.js for dynamic, real-time visualizations
- Docker-based containerized application
- Privileged mode for direct host resource access
- Responsive web interface

#### Requirements
- Docker with compose support
- Host system with accessible `/proc` filesystem
- Optional: NVIDIA GPU for GPU monitoring

#### Monitoring Metrics
- **CPU**
  - Total CPU usage percentage
  - Per-core usage
  - 1, 5, and 15-minute load averages
  - Historical charts for each metric

- **Memory**
  - Total system memory
  - Used memory
  - Available memory
  - Memory buffers
  - Cached memory
  - Swap space usage

- **GPU** (if available)
  - GPU utilization
  - GPU memory usage
  - GPU temperature
  - **New: GPU temperature history chart**

#### Notes
- Requires a system with NVIDIA GPU for full GPU monitoring
- Designed for development and local system monitoring
- Not recommended for production deployment without additional security configurations
- Provides a web interface at `http://localhost:5000`

#### Deployment
```bash
# Navigate to the project directory
cd /path/to/project

# Build and start the container
docker compose up --build
```

## Analysis Visualisation

### analysis_visualisation_001

WIP - to be added soon.
