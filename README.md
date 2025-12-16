# NextJS MySQL DevOps Assessment - Interview Challenge

Welcome to the **DevOps Interview Assessment**! This is a hands-on practical evaluation designed to test your DevOps knowledge and skills. As an interview candidate, you must complete the following tasks to demonstrate your understanding of containerization, CI/CD pipelines, and modern deployment practices.

## 📋 Interview Assessment Overview

This assessment evaluates your ability to:
- ✅ Create production-ready Docker images
- ✅ Implement Docker Compose for multi-container applications
- ✅ Push Docker images to Docker Hub
- ✅ Set up GitHub Actions CI/CD pipelines
- ✅ Configure secure secrets management
- ✅ Troubleshoot and debug containerized applications

**Assessment Format**: Hands-on practical exercise
**Time Expected**: 2-3 hours
**Difficulty Level**: Intermediate to Advanced
**Technologies**: Docker, Docker Compose, GitHub Actions, Docker Hub

---

## ⚠️ ASSESSMENT INSTRUCTIONS - READ CAREFULLY

### Before You Start

**This repository contains ONLY the application code.** Your task is to complete the DevOps infrastructure setup. This is your interview assessment.

**What you need to do:**
1. ✅ Fork this repository to your GitHub profile (make it PUBLIC)
2. ✅ Create a Dockerfile with multi-stage build
3. ✅ Create docker-compose.yml with app + database
4. ✅ Create database initialization script
5. ✅ Set up GitHub Actions CI/CD pipeline
6. ✅ Push Docker image to Docker Hub
7. ✅ Document your implementation

**You should already have:**
- Docker Desktop installed
- Docker Hub account
- GitHub account
- Basic Docker & DevOps knowledge

---

## 🚀 Assessment Requirements - TASK LIST

### TASK 1: Fork Repository to PUBLIC GitHub Profile ⭐ REQUIRED

**Objective**: Make your work visible to the interviewer

**Steps**:
1. Click **Fork** button on this repository (top-right)
2. Fork to your personal GitHub account
3. Go to **Settings → Visibility**
4. Change to **Public** (so interviewer can view it)
5. Copy your fork URL

```bash
# Clone YOUR fork (not the original)
git clone https://github.com/YOUR_USERNAME/nextjs-mysql-devops-test.git
cd nextjs-mysql-devops-test
```

**Validation**:
- ✅ Your fork is visible at https://github.com/YOUR_USERNAME/nextjs-mysql-devops-test
- ✅ Repository is PUBLIC
- ✅ You have push access

---

### TASK 2: Create Production-Ready Dockerfile ⭐ REQUIRED

**Objective**: Create an optimized Docker image using multi-stage build

**Requirements**:
- [ ] Use Node.js 18-Alpine base image
- [ ] Implement multi-stage build (deps, builder, runner)
- [ ] Minimize final image size (target: <200MB)
- [ ] Use non-root user for security
- [ ] Include health check
- [ ] Proper error handling

**Expected File**: `./Dockerfile`

**Key Points to Cover**:
- Why multi-stage build?
- Why Alpine Linux?
- Why non-root user?
- What's in .dockerignore?

**Testing**:
```bash
# Build locally
docker build -t myapp:latest .

# Check image size
docker images

# Run container
docker run -d -p 3000:3000 --name test myapp:latest

# Verify it works
curl http://localhost:3000

# Check logs
docker logs test
```

---

### TASK 3: Create .dockerignore File ⭐ REQUIRED

**Objective**: Exclude unnecessary files from Docker build

**Requirements**:
- [ ] Exclude node_modules
- [ ] Exclude .git and .github
- [ ] Exclude environment files (.env)
- [ ] Exclude build artifacts
- [ ] Exclude IDE/Editor files

**Expected File**: `./.dockerignore`

---

### TASK 4: Create docker-compose.yml ⭐ REQUIRED

**Objective**: Orchestrate multi-container application

**Requirements**:
- [ ] Define app service (builds from Dockerfile)
- [ ] Define db service (MySQL 8.0)
- [ ] Set up proper networking
- [ ] Configure volumes for database persistence
- [ ] Add health checks for both services
- [ ] Set environment variables
- [ ] Configure depends_on relationships

**Expected File**: `./docker-compose.yml`

**Testing**:
```bash
# Start services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f

# Test database
docker-compose exec db mysql -uroot -ppassword -e "SHOW DATABASES;"

# Stop services
docker-compose down
```

---

### TASK 5: Create Database Initialization Script ⭐ REQUIRED

**Objective**: Set up database schema automatically

**Requirements**:
- [ ] Create users table with proper schema
- [ ] Add indexes for performance
- [ ] Insert sample data
- [ ] Use idempotent queries (IF NOT EXISTS)

**Expected File**: `./database/init.sql`

**What it should include**:
- Table creation
- Column definitions
- Primary key
- Unique constraints
- Timestamps
- Sample data

---

### TASK 6: Create Docker Hub Repository & Push Image ⭐ REQUIRED

**Objective**: Publish Docker image to public registry

**Steps**:
1. Create account at https://hub.docker.com (if not done)
2. Create new repository: `nextjs-mysql-devops-test`
3. Make it PUBLIC
4. Create access token at https://hub.docker.com/settings/security
5. Login locally: `docker login`
6. Tag image: `docker tag myapp:latest YOUR_USERNAME/nextjs-mysql-devops-test:latest`
7. Push: `docker push YOUR_USERNAME/nextjs-mysql-devops-test:latest`
8. Verify at Docker Hub

**Validation**:
- ✅ Image visible at https://hub.docker.com/r/YOUR_USERNAME/nextjs-mysql-devops-test
- ✅ Can pull with `docker pull YOUR_USERNAME/nextjs-mysql-devops-test:latest`
- ✅ Includes proper description and tags

---

### TASK 7: Create GitHub Actions CI/CD Workflow ⭐ REQUIRED

**Objective**: Automate Docker build and push on every commit

**Requirements**:
- [ ] Trigger on push to main branch
- [ ] Checkout code
- [ ] Set up Docker Buildx
- [ ] Login to Docker Hub using secrets
- [ ] Build Docker image
- [ ] Push to Docker Hub
- [ ] Proper tagging strategy

**Expected File**: `.github/workflows/docker-build-push.yml`

**Key Points**:
- Use docker/build-push-action
- Use GitHub Secrets for credentials
- Implement smart tagging (latest, branch, SHA)
- Only push on main (not PRs)

---

### TASK 8: Configure GitHub Secrets ⭐ REQUIRED

**Objective**: Securely store Docker Hub credentials

**Steps**:
1. Go to your GitHub repository
2. Settings → Secrets and variables → Actions
3. Create secret: `DOCKERHUB_USERNAME` = your Docker Hub username
4. Create secret: `DOCKERHUB_TOKEN` = your Docker Hub access token

**Testing**:
1. Commit and push code to main branch
2. Go to Actions tab
3. Watch workflow run
4. Verify image pushed to Docker Hub

---

### TASK 9: Create docker-compose.prod.yml (BONUS) ⭐ OPTIONAL

**Objective**: Production-ready Docker Compose using Docker Hub image

**Requirements**:
- [ ] Use image from Docker Hub (not build from Dockerfile)
- [ ] Optimized settings for production
- [ ] No volume mounts for code (immutable)
- [ ] Proper resource limits
- [ ] Restart policies

---

### TASK 10: Document Your Implementation ⭐ REQUIRED

**Objective**: Explain your DevOps decisions

**Create file**: `./IMPLEMENTATION.md`

**Include**:
1. **Architecture Overview**
   - Diagram or description of your setup
   - Services and their responsibilities

2. **Docker Strategy**
   - Why multi-stage build?
   - Image size optimization
   - Security measures (non-root user, etc.)

3. **Database Setup**
   - Schema design
   - Why MySQL 8.0?
   - Persistence strategy

4. **CI/CD Pipeline**
   - How it works
   - Triggered on what events?
   - Security (secrets management)

5. **Deployment Instructions**
   - How to run locally
   - How to deploy with Docker Hub image
   - Troubleshooting tips

6. **Challenges & Solutions**
   - What problems did you face?
   - How did you solve them?
   - What would you improve?

---

## 📊 Grading Criteria

Your assessment will be evaluated on:

| Criteria | Points | Evaluation |
|----------|--------|-----------|
| **Dockerfile** | 15 | Multi-stage build, security, optimization |
| **docker-compose.yml** | 15 | Networking, volumes, health checks, dependencies |
| **Database Setup** | 10 | Schema design, initialization script |
| **CI/CD Pipeline** | 20 | Automation, correct triggers, secrets management |
| **Docker Hub Push** | 15 | Successful image push, proper tagging |
| **GitHub Setup** | 10 | Repository public, proper secrets, workflow running |
| **Documentation** | 10 | Clear explanation, architecture decisions, troubleshooting |
| **Code Quality** | 5 | Clean code, comments, best practices |
| **Total** | **100** | - |

---

## 🎯 Success Criteria - Interview Questions

Be prepared to answer:

1. **"Explain your Dockerfile - why did you make those choices?"**
   - Expected: Discuss multi-stage, Alpine, non-root, optimization

2. **"What's in your docker-compose.yml and why?"**
   - Expected: Services, networking, volumes, health checks, environment vars

3. **"How does your CI/CD pipeline work?"**
   - Expected: Triggers, build steps, registry push, automatic tagging

4. **"How do you handle secrets securely?"**
   - Expected: GitHub Secrets, never in code, access tokens

5. **"What would you do if the database container crashes?"**
   - Expected: Health checks, restart policies, volume persistence

6. **"How would you scale this application?"**
   - Expected: Multiple app instances, load balancer, database replicas, caching

7. **"Show me your Docker image on Docker Hub"**
   - Expected: Public repository, proper tags, accessible

---

## 🔍 Submission Checklist

Before claiming completion:

- [ ] Fork is PUBLIC on your GitHub profile
- [ ] Dockerfile created and optimized
- [ ] .dockerignore file created
- [ ] docker-compose.yml working locally
- [ ] database/init.sql creates tables and seeds data
- [ ] Docker Hub repository created and public
- [ ] Image successfully pushed to Docker Hub
- [ ] GitHub Actions workflow created (.github/workflows/docker-build-push.yml)
- [ ] GitHub Secrets configured (DOCKERHUB_USERNAME, DOCKERHUB_TOKEN)
- [ ] CI/CD pipeline triggered and image pushed
- [ ] IMPLEMENTATION.md created with documentation
- [ ] All code committed and pushed
- [ ] Can run full stack locally: `docker-compose up -d`
- [ ] Can verify app: `curl http://localhost:3000`
- [ ] Can verify database: `docker-compose exec db mysql ...`

**Interviewer should be able to**:
- [ ] Access your public GitHub repository
- [ ] See your Dockerfile and docker-compose.yml
- [ ] View your GitHub Actions workflows
- [ ] See your Docker Hub image repository
- [ ] Understand your architecture from IMPLEMENTATION.md
- [ ] Pull and run your image locally

---

## 📚 Resources Available

Helpful documentation in this repository:
- **DEVOPS_GUIDE.md** - Detailed implementation guide
- **QUICK_REFERENCE.md** - Docker and Git commands
- **GITHUB_SECRETS_SETUP.md** - Step-by-step secrets configuration
- **SETUP_COMPLETE.md** - Overview of what's needed

---

## ⏱️ Time Management

**Recommended time allocation**:
- Task 1-2: 15 minutes (fork + setup)
- Task 3-4: 20 minutes (Dockerfile + docker-compose)
- Task 5-6: 25 minutes (database + Docker Hub)
- Task 7-8: 20 minutes (GitHub Actions + secrets)
- Task 9-10: 30 minutes (prod config + documentation)
- Testing & debugging: 15 minutes
- **Total: 2-3 hours**

---

## 🆘 If You Get Stuck

1. **Check DEVOPS_GUIDE.md** for detailed instructions
2. **Check QUICK_REFERENCE.md** for common commands
3. **Check GITHUB_SECRETS_SETUP.md** for CI/CD help
4. **Review error messages carefully** - they usually indicate the problem
5. **Search error messages on GitHub/Docker docs**

Common issues:
- Port 3000 already in use: `kill -9 $(lsof -t -i:3000)`
- Docker build fails: `docker system prune -a` then rebuild
- Can't push to Docker Hub: Verify login with `docker login` and `docker images`
- CI/CD not running: Check GitHub Actions tab for errors

---

## 📝 Submission Instructions

**To submit your assessment**:

1. **Ensure everything is in your PUBLIC GitHub repository**
   ```bash
   git add .
   git commit -m "feat: complete DevOps assessment"
   git push origin main
   ```

2. **Share your repository URL** with the interviewer:
   - `https://github.com/YOUR_USERNAME/nextjs-mysql-devops-test`

3. **Share your Docker Hub repository** (if different):
   - `https://hub.docker.com/r/YOUR_USERNAME/nextjs-mysql-devops-test`

4. **Be ready to discuss**:
   - Your architecture decisions
   - Why you chose specific tools/approaches
   - Challenges you faced
   - How you would improve this in production

---

## 🎓 Learning Outcomes

After completing this assessment, you will understand:

✅ **Docker & Containerization**
- Multi-stage builds and optimization
- Image creation and security
- Container configuration and health checks

✅ **Container Orchestration**
- docker-compose syntax and structure
- Service dependencies and networking
- Volume management and persistence

✅ **CI/CD Implementation**
- GitHub Actions workflows
- Automated build and push
- Registry integration
- Secrets management

✅ **DevOps Practices**
- Infrastructure as Code
- Automated deployments
- Container security
- Production readiness

✅ **Professional Communication**
- Architecture documentation
- Technical decision-making
- Problem-solving explanation

---

## 🚀 Good Luck!

This assessment demonstrates your readiness for a DevOps role. Show your understanding of:
- **Why** you made architectural decisions
- **How** each component works
- **What** best practices you follow
- **Where** you can improve

**Remember**: It's not just about getting it working - it's about understanding why it works and being able to explain it clearly.

**You've got this! 💪**

---

**Ready?** Start with **TASK 1: Fork Repository** and work through each task in order.

---

## � How to Approach This Assessment

### Phase 1: Understand the Requirements (15 minutes)
1. Read this entire README carefully
2. Review each TASK requirement
3. Check the success criteria
4. Plan your approach

### Phase 2: Build Docker Infrastructure (1 hour)
1. Create Dockerfile with multi-stage build
2. Create docker-compose.yml with services
3. Create database initialization script
4. Test locally with `docker-compose up -d`

### Phase 3: Set Up CI/CD (45 minutes)
1. Push Dockerfile to GitHub
2. Create Docker Hub repository
3. Create GitHub Actions workflow
4. Configure GitHub Secrets
5. Test automatic push

### Phase 4: Documentation & Submission (30 minutes)
1. Create IMPLEMENTATION.md explaining your choices
2. Verify everything is in your PUBLIC GitHub repo
3. Test that interview can access and understand it
4. Prepare to discuss your decisions

---

## ✨ What Makes a Great Assessment

**Good submissions demonstrate**:
- ✅ Understanding of multi-stage builds and why they matter
- ✅ Proper Docker Compose configuration with health checks
- ✅ Secure secrets management in CI/CD
- ✅ Clear documentation of architectural decisions
- ✅ Ability to explain design choices

**Excellent submissions also include**:
- ✅ Optimized image size (<150MB)
- ✅ Production-ready docker-compose.prod.yml
- ✅ Additional GitHub Actions workflows (tests, linting)
- ✅ Comprehensive IMPLEMENTATION.md with diagrams
- ✅ Thoughtful discussion of scaling and security

---

## 🔗 Reference Files

These files in this repo provide guidance (read-only):
- **DEVOPS_GUIDE.md** - Detailed step-by-step guide
- **QUICK_REFERENCE.md** - Common Docker commands
- **GITHUB_SECRETS_SETUP.md** - Secrets configuration guide

---

## � Resources & Reference

### Official Documentation
- [Docker Official Documentation](https://docs.docker.com)
- [Docker Compose Reference](https://docs.docker.com/compose)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Docker Hub](https://hub.docker.com)

### Learning Materials in This Repository
- **DEVOPS_GUIDE.md** - Detailed implementation walkthrough
- **QUICK_REFERENCE.md** - Essential Docker and Git commands
- **GITHUB_SECRETS_SETUP.md** - Step-by-step secrets configuration

---

## 🎤 Interview Discussion Topics

Be prepared to discuss:

**Architecture & Design**
- Why did you choose multi-stage builds?
- How does your docker-compose handle dependencies?
- What are the trade-offs in your design?

**Security**
- How do you protect sensitive data?
- Why use a non-root user in Docker?
- How do you manage secrets in CI/CD?

**Scalability**
- How would you scale this application?
- What happens when traffic increases?
- Would you use Kubernetes? When?

**Troubleshooting**
- What if the database container crashes?
- How would you debug a failing deployment?
- How do you monitor production containers?

**Best Practices**
- Why use Alpine Linux?
- What's the importance of health checks?
- How do you handle database migrations?

---

## 📝 Assessment Summary

**What You'll Learn**:
- ✅ Production-ready Docker image creation
- ✅ Multi-container application orchestration
- ✅ Automated CI/CD pipeline setup
- ✅ DevOps best practices
- ✅ Infrastructure documentation

**What Interviewers Evaluate**:
- ✅ Technical understanding of containerization
- ✅ DevOps knowledge and best practices
- ✅ Ability to explain architectural decisions
- ✅ Problem-solving and debugging skills
- ✅ Clear communication and documentation

---

## 🎯 Final Checklist

Before submission:

```bash
# Verify repository structure
ls -la
ls -la .github/workflows/

# Test your setup
docker-compose up -d
docker-compose ps
curl http://localhost:3000
docker-compose down

# Verify GitHub setup
git log --oneline | head -5
git remote -v

# Check GitHub secrets exist (in GitHub UI)
# Settings → Secrets → should show DOCKERHUB_USERNAME and DOCKERHUB_TOKEN
```

---

## 🚀 You're Ready to Start!

**Begin with TASK 1** and work through systematically. This assessment tests your practical DevOps skills - show what you know!

**Questions during assessment?** Refer to the reference materials or think through the problem using DevOps principles.

**Good luck! 💪**

