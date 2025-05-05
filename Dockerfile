# Use lightweight Nginx image
FROM nginx:alpine

# Copy HTML file to Nginx default public folder
COPY index.html /usr/share/nginx/html/

# Expose port 80 (default HTTP port)
EXPOSE 80

# Nginx starts automatically when the container runs