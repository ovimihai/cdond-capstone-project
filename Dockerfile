FROM python:3.7.13-buster

ENV USER_NAME=app
ENV USER_ID=1000
ENV GROUP_ID=1000

RUN useradd -l -u $USER_ID $USER_NAME

RUN mkdir -p /opt/venv \
    && chown -R $USER_ID:$GROUP_ID /opt/venv/

USER $USER_ID:$GROUP_ID

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY app /app/

## Step 3:
# Install packages from requirements.txt

# hadolint ignore=DL3013
RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install -r /app/requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["/opt/venv/bin/python", "app.py"]