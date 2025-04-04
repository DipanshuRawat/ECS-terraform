FROM node:18

WORKDIR /app

# Copy package.json and package-lock.json first for efficient caching
COPY package.json package-lock.json ./

# Clear npm cache (fixes some dependency issues)
RUN npm cache clean --force

# Install dependencies
RUN npm ci  # Use 'npm install' if no package-lock.json

# Copy remaining project files
COPY . .

# Expose Medusa's default port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
