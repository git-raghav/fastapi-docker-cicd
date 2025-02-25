# 🚀 Continuous Delivery of a Dockerized FastAPI Application using GitHub Actions

## 📌 Overview
This assignment demonstrates Continuous Delivery (CD) by automating the creation and deployment of a Dockerized FastAPI application using GitHub Actions.

## Features
- **FastAPI Server** responding with JSON data.
- **Docker Containerization** using Ubuntu as the base image.
- **GitHub Actions CI/CD** to build and push the image to Docker Hub.

## 📂 Project Directory Structure
```
DevOps-Assignment/
│── app/
│   ├── main.py
│── requirements.txt
│── Dockerfile
│── .github/
│   └── workflows/
│       └── DockerBuild.yml
│── README.md
```

## 🛠️ How to Install and Run Locally

1. 🔹 Clone the repository:
   ```bash
   git clone https://github.com/git-raghav/fastapi-docker-cicd.git
   cd fastapi-docker-cicd
   ```

2. 🔹 Create a virtual environment and activate it:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. 🔹 Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. 🔹 Run the FastAPI server:
   ```bash
   uvicorn app.main:app --host 0.0.0.0 --port 8000
   ```

5. 🔹 Open a browser and go to:
   ```
   http://localhost:8000/
   ```

## 🐳 How to Build and Run Docker Image

1. 🔹 Build the Docker image:
   ```bash
   docker build -t fastapi-app .
   ```

2. 🔹 Run the container:
   ```bash
   docker run -p 8000:8000 fastapi-app
   ```

3. 🔹 Open a browser and go to:
   ```
   http://localhost:8000/
   ```

## ⚙️ GitHub Actions Workflow Explanation
The GitHub Actions workflow automates the build and push process to Docker Hub. It consists of:

- **Trigger:** Runs on every push to the `main` branch.
- **Steps:**
  1. ✅ Checkout the repository.
  2. 🔑 Log in to Docker Hub using secrets.
  3. 📦 Build the Docker image.
  4. 🚀 Push the image to Docker Hub.
  5. 🔒 Logout from Docker Hub.

### 📜 Workflow File: `.github/workflows/DockerBuild.yml`
```yaml
name: Docker Image Build and Push

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Log in to Docker Hub
        run: |
          echo "${{ secrets.DOCKERTOKEN }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Build Docker Image
        run: |
          docker build -t ${{ secrets.DOCKER_USERNAME }}/fastapi-app:latest .

      - name: Push Docker Image to Docker Hub
        run: |
          docker push ${{ secrets.DOCKER_USERNAME }}/fastapi-app:latest

      - name: Logout from Docker Hub
        run: docker logout
```

## 🔑 Steps for Setting Up Docker Token and Secrets

### 🔹 Generate a Docker Hub Personal Access Token (PAT)
1. 🔐 Log in to Docker Hub.
2. 🛠️ Go to **Account Settings > Security**.
3. 🎟️ Under **Access Tokens**, click **Generate Token**.
4. ✍️ Provide a description (e.g., `GitHubActionsToken`).
5. 📝 Select **Read & Write** permissions.
6. 🎯 Click **Generate Token**.
7. 📋 Copy the token (it will not be shown again).

### 🔹 Add Docker Credentials to GitHub Secrets

1. 🧭 **Navigate to your GitHub repository.**
2. ⚙️ **Go to** **Settings > Secrets and variables > Actions**.
3. 👆 **Click** **New repository secret** and add the following:
   - 🔑 **DOCKERTOKEN**: Paste your Docker access token.
   - 👤 **DOCKER_USERNAME**: Enter your Docker Hub username.
4. ✅ **Click** **Add secret** for each.

This ensures your GitHub Actions workflow can authenticate with Docker Hub. 🚀

## 🚀 Pushing the Project to GitHub
```bash
git init
git remote add origin https://github.com/git-raghav/fastapi-docker-cicd.git
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

## ✅ Checking If the Workflow Ran Successfully
1. 🔹 Go to your GitHub repository.
2. 🔹 Click on the **Actions** tab.
3. 🔹 Find the latest workflow run.
4. 🔹 Ensure all steps have green checkmarks (✅).
5. 🔹 Go to Docker Hub and check if the `fastapi-app:latest` image was pushed successfully.
6. 🔹 Run the image locally using:
   ```bash
   docker run -p 8000:8000 raghavagarwal/fastapi-app:latest
   ```
7. 🔹 Open a browser and go to:
   ```
   http://localhost:8000/
   ```

## 🔗 Links
[GitHub Repository](https://github.com/git-raghav/fastapi-docker-cicd.git)
[Docker Hub Image](https://hub.docker.com/repository/docker/raghavcodes/fastapi-app/general)

This documentation provides a complete guide for setting up and deploying a Dockerized FastAPI application with Continuous Delivery using GitHub Actions. 🎯
