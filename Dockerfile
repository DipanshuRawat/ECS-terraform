FROM node:18

# Install Medusa CLI
RUN npm install -g @medusajs/medusa-cli

# Create Medusa project without prompts
RUN yes | medusa new my-medusa-store --seed --no-telemetry

# Set working directory
WORKDIR /my-medusa-store

# Install dependencies
RUN npm install

# Expose port
EXPOSE 9000

# Start the Medusa server
CMD ["npm", "run", "start"]
