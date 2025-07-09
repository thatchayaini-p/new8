# Use an official Node.js image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app for production
RUN npm run build

# Install serve to serve the production build
RUN npm install -g serve

# Expose port 3000 to allow traffic to the app
EXPOSE 3000

# Start the app using serve
CMD ["serve", "-s", "build", "-l", "3000"]

