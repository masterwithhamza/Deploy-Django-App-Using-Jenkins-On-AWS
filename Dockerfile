# Use an official Python runtime as the base image
FROM python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONPATH=/app

# Set the working directory in the Docker image
WORKDIR /app

# Copy the requirements.txt file to the image
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files to the image
COPY . .

# Collect static files
RUN python manage.py collectstatic --no-input

# Expose the port on which the Django app will run (change as per your app configuration)
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
