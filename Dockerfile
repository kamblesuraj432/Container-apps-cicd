# Use the official NGINX image as a base
FROM nginx:latest

# Copy custom configuration files (if needed)
WORKDIR /app
# Copy your website files
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP
EXPOSE 80

# Command to run NGINX
CMD ["nginx", "-g", "daemon off;"]
