FROM node:20-slim

# Set working directory
WORKDIR /usr/src/app

# Ensure node is found by scripts during npm install
RUN ln -s /usr/local/bin/node /usr/bin/node

# Install git for clone
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone your fork
RUN git clone https://github.com/arrfonseca/evolution-manager.git .

# Install dependencies
RUN npm install

# Expose the default port
EXPOSE 9615

# Start the app
CMD ["npm", "run", "start"]
