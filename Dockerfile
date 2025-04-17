FROM node:20-slim

# Set working directory
WORKDIR /usr/src/app

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone your actual repo content into the container
RUN git clone https://github.com/arrfonseca/evolution-manager.git .

# Install deps
RUN npm install

EXPOSE 9615

CMD ["npm", "run", "start"]
