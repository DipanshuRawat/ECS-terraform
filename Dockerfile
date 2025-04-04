# Use official Node.js image
FROM node:16.20.1

# Set the working directory
WORKDIR /app

# Install Medusa CLI
RUN npm install -g @medusajs/medusa-cli

# Create a new Medusa project
RUN medusa new my-medusa-store --seed

# Move into the project directory
WORKDIR /app/my-medusa-store

# Install dependencies
RUN npm install

# Expose Medusa's default port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
