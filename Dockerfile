# Use official Node.js base image
FROM node:20-slim

# Set working directory
WORKDIR /usr/src/app

# Create a persistent data directory
RUN mkdir -p /usr/src/app/data && \
    chown -R node:node /usr/src/app/data

# Optional: Install any required global deps
RUN npm install -g vite

# Make sure node is in PATH for compatibility
RUN ln -s /usr/local/bin/node /usr/bin/node

# Optional: switch to non-root user (safer)
# USER node

# Expose app port
EXPOSE 9615

# Run the application
ENTRYPOINT ["npx", "evolution-manager", "server", "start"]
