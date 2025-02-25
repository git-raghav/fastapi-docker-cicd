# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python, pip, and venv
RUN apt update && apt install -y python3 python3-pip python3-venv

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Create and activate a virtual environment, then install dependencies
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app ./app

# Expose the port FastAPI will run on
EXPOSE 8000

# Run the FastAPI server using Uvicorn inside the virtual environment
CMD ["/app/venv/bin/uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
