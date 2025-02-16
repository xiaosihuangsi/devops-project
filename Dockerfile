# Use the official Node.js image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the application source code
COPY . .

# Start the application
CMD ["npm", "start"]

# Expose port 3000
EXPOSE 3000
