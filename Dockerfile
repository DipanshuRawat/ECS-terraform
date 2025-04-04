FROM node:18

WORKDIR /app

# Copy only package.json first for efficient caching
COPY package.json ./

# Clear npm cache (fixes dependency issues)
RUN npm cache clean --force

# Install dependencies
RUN npm install --legacy-peer-deps  # Fix dependency conflicts

# Copy remaining project files
COPY . .

# Expose Medusa's default port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
