# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of your application's source code to the container
COPY . .

# Build the React application (for production)
RUN npm run build

# Serve the production build using a lightweight web server
# You can choose different server tools depending on your preferences
# In this example, we'll use 'serve' to serve the static files
RUN npm install -g serve

# Expose port 80 for your application
EXPOSE 80

# Define the command to serve your production build
CMD ["serve", "-s", "build", "-l", "80"]
