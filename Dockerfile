FROM python:3.7-alpine

WORKDIR /usr/src/app

# Step 1: copy files to WORKDIR directory
COPY *.py requirements.txt version.json ./

# Step 2: install dependencies
RUN python -m pip install -r requirements.txt

# Step 3: run a command for testing
CMD ["python", "calculator.py", "multiply", "5", "9"]