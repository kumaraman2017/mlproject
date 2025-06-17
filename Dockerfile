# Use official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies (awscli + required build tools)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        awscli \
        gcc \
        libffi-dev \
        libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY . .

# Command to run the application
CMD ["python", "app.py"]

