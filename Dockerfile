FROM node:20-slim

# Install dependencies needed for building (optional: if there are native modules)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Clone your forked repo (you can use a COPY if building locally)
RUN git clone https://github.com/arrfonseca/evolution-manager.git .

# Install dependencies
RUN npm install

# Expose app port
EXPOSE 9615

# Optional: set up a persistent data folder
RUN mkdir -p /usr/src/app/data

# Start the app
CMD ["npm", "run", "start"]
