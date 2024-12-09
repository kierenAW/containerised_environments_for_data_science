## Data Wrangling

### data_wrangling_001

A data engineering environment with JupyterLab that includes various tools for working with data. The container starts with JupyterLab running for immediate access.

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

#### Features:
- All features from data_wrangling_001
- SSH access for remote development
- JupyterLab interface


## Machine Learning

### machine_learning_001

A machine learning environment with JupyterLab that includes various tools for developing, training and testing machine learning models, with support for Large Language Models (LLMs). The container starts with JupyterLab running for immediate access and provides SSH access using a key. A static Jupyter token is also configurable at build time. This environment is built for CPU usage, ensuring wide compatibility across different systems, but does not include GPU acceleration.


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


## Analysis Visualisation

### analysis_visualisation_001

WIP - to be added soon.



## Apps

### app_01
WIP - to be added soon.