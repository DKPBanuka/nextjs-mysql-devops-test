# NextJS + MySQL DevOps Interview Tasks

This assessment is simple: complete the items below and share the resulting links. No how-to details are provided—just deliver the outcomes.

## Tasks to complete
1. Fork this repository to your GitHub profile and keep it public.
2. Create a Dockerfile to run the project.
3. Create `docker-compose.yml` with the app and a MySQL database.
4. Set up a GitHub Actions CI/CD pipeline that builds the web app image and pushes it to Docker Hub or GitHub Container Registry.
5. Document what you implemented and how to run the project with `docker-compose.yml` (beginner-friendly).
6. Provide your public repository link and the published Docker image link(s).

## Build targets
- Node.js version: 18.x (use the same in Dockerfile, compose, and CI).
- Next.js build commands:
  ```bash
  npm ci
  npm run build
  npm run start
  ```
  (Use `npm install` locally if you are not in CI.)

## Links to provide (fill in after completion)
- Public fork: https://github.com/YOUR_USERNAME/nextjs-mysql-devops-test
- Published image: docker.io/YOUR_USERNAME/nextjs-mysql-devops-test:latest (or ghcr.io/YOUR_USERNAME/nextjs-mysql-devops-test:latest)
- Optional: Latest CI/CD run URL

## Final submission
Email the following to support@weblankan.com with CC to manager@weblankan.com:
- Link to your public fork.
- Link to the built Docker Hub (or GHCR) image.
- Screenshot of a successful GitHub Actions run.
- Screenshot of the running web app UI.
- A short, beginner-friendly note on running with `docker compose` (env file, `docker compose up -d --build`, and `docker compose down`).

## Scoring

### 1. Repository Setup & Visibility — 25 Points
- Working public URL: 5 pts
- Comprehensive documentation in `README.md`: 15 pts
- Relevant screenshots included in `README.md`: 5 pts

### 2. Dockerfile — 25 Points
- Well-documented Dockerfile with clear comments: 20 pts
- Advanced Docker practices (multi-stage build, non-root user, security best practices, health checks): 5 pts (attempt only if you fully understand the requirements)

### 3. docker-compose.yml — 25 Points
- Properly documented `docker-compose.yml` with app + MySQL, environment variables, and volumes: 20 pts
- Health checks configured correctly: 5 pts (attempt only if you fully understand the requirements)

### 4. GitHub Actions (CI/CD) — 25 Points
- Pipeline for building and pushing Docker images to a registry: 20 pts
- Multi-stage pipeline configuration: 5 pts
