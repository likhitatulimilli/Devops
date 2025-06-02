# 🚀 Deploying TETRIS using CI/CD and DevSecOps with ArgoCD

This project demonstrates a complete DevSecOps pipeline to deploy a simple Tetris application using Jenkins, SonarQube, Trivy, Docker, Terraform, and ArgoCD on AWS EKS. The primary goal is to showcase **pipeline-driven automation** for application delivery, including version updates without changing the load balancer endpoint.

---

## Project Idea

This project showcases an end-to-end DevSecOps CI/CD pipeline that automatically builds, scans, and deploys a containerized Tetris web application on AWS EKS using ArgoCD for GitOps. It simulates a real-world enterprise deployment workflow with version control, automated image updates, and infrastructure provisioning—all integrated into Jenkins pipelines.

The main idea is to demonstrate continuous delivery through GitOps: every time code or image is updated, the changes are automatically reflected in the production environment without manual intervention.

---
## 🔧 Project Overview

- **Version 1**: Initial deployment of the Tetris application.
- **Version 2**: Updated application build deployed via a second CI/CD pipeline.
- The EKS cluster and infrastructure are provisioned with **Terraform**.
- Application deployments are automated using **ArgoCD**, synced from a GitHub repo.
- Security scans using **SonarQube** and **Trivy** are included as part of the pipeline.
- GitOps-based update: When a new Docker image is built and pushed, the pipeline updates the `deployment.yml`, which triggers ArgoCD to roll out the new version.





https://github.com/user-attachments/assets/6e260744-07c4-4197-a2cf-f70007e9c822



---



## 🏗️ Architecture
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/devsecops_pipeline.png)

---

## ⚙️ Tools Used

- **Jenkins** – CI/CD automation
- **Terraform** – Provisioning AWS EKS
- **Docker** – Containerization
- **SonarQube** – Static code analysis
- **Trivy** – File system and container image vulnerability scanning
- **ArgoCD** – GitOps deployment to Kubernetes
- **AWS EKS** – Managed Kubernetes cluster
- **GitHub** – Source and deployment manifest repositories

---

## 📁 Jenkins Pipelines

### ✅ Pipeline 1 – Infrastructure Provisioning

**Purpose**: Creates the AWS EKS cluster using Terraform.
[Tetris-manifest](https://github.com/Sunil-3012/tetris-manifest)

Stages:
- Checkout Terraform code from GitHub
- Initialize, validate, plan, and apply/destroy Terraform configurations
- Stores state in S3 bucket
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/EKS_pipeline.png)
---

### ✅ Pipeline 2 – Version 1 Deployment

**Purpose**: Deploys the initial version of the Tetris app.

Stages:
- Code checkout from GitHub
- Static code analysis via SonarQube
- Dependency installation via `npm install`
- Trivy file scan
- Docker image build and push to Docker Hub
- Trivy image scan
- GitOps: Update deployment manifest in separate GitHub repo
- ArgoCD automatically syncs and deploys app to EKS
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/v1_pipeline.png)
---

### ✅ Pipeline 3 – Version 2 Deployment

**Purpose**: Simulates a new version release.
[Version-2](https://github.com/Sunil-3012/tetris-devsecops-v2)

Stages (similar to Pipeline 2, with updated repo/image):
- Checkout updated codebase from GitHub (v2)
- Re-run analysis, scans, build, and push
- Replace image path in `deployment.yml`
- Push changes to manifest GitHub repo
- ArgoCD detects manifest change and redeploys updated app
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/v2_pipeline.png)
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/argocd_v2.png)
---

## Final Ouput
### Version-1
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/v1_app.png)

### Version-2
![](https://github.com/Sunil-3012/tetris-devsecops-v1/blob/main/images/v2_app.png)
---

## Future Improvements

* Add Helm Support: Replace raw Kubernetes YAML files with Helm charts for better templating and version control.

* Implement Blue-Green or Canary Deployments: Enhance deployment strategy using ArgoCD Rollouts for zero-downtime updates.

* Enable RBAC & SSO in ArgoCD: Improve security by enabling role-based access and integrating with OAuth or LDAP.

* Secrets Management: Integrate with HashiCorp Vault or AWS Secrets Manager for secure secret handling.

* Add Monitoring/Alerting: Use Prometheus, Grafana, and Alertmanager to monitor app health and pipeline metrics.

* Integrate Slack or Teams Alerts: Notify pipeline and deployment status to a DevOps channel.

## Credits

The original source code for the Tetris application version-2 was developed by [Marcelo Pires Carvalho](https://github.com/mpirescarvalho).

Thanks to the open-source community for enabling learning through real-world projects.
