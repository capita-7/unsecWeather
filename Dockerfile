# Use Python 3.4-alpine3.9 as base image
FROM python:3.4-alpine3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies
RUN apk update && \
    apk add --no-cache gcc musl-dev libffi-dev openssl-dev freetype-dev libpng-dev && \
    pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Command to run the Python script
CMD ["python", "wheatherinfo.py"]
