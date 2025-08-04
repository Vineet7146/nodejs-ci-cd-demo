FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 5000

# Command to start the app
CMD ["npm", "start"]
