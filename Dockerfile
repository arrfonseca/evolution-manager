FROM node:20-slim

WORKDIR /usr/src/app

# Make sure node is available
RUN ln -s /usr/local/bin/node /usr/bin/node

# Install Git and Vite
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN npm install -g vite

# Clone your repo
RUN git clone https://github.com/arrfonseca/evolution-manager.git .

# Install app dependencies
RUN npm install

EXPOSE 9615

CMD ["npm", "run", "start"]
