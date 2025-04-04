FROM node:18

WORKDIR /app


# Install dependencies
RUN npm ci  # Use 'npm install' if no package-lock.json

# Copy remaining project files
COPY . .

# Expose Medusa's default port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
