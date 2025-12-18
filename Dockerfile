# Stage 1: Install dependencies
# We use a lightweight node image
FROM node:18-alpine AS deps
WORKDIR /app

# Copy package files first to leverage Docker cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Stage 2: Build the application
FROM node:18-alpine AS builder
WORKDIR /app

# Copy installed node_modules from the previous stage
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Build the Next.js application (creates .next folder)
RUN npm run build

# Stage 3: Production image
FROM node:18-alpine AS runner
WORKDIR /app

# Set environment to production
ENV NODE_ENV production

# Use a non-root user for better security
USER node

# Copy only necessary files for the production build
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/knexfile.ts ./knexfile.ts
COPY --from=builder /app/database ./database

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]