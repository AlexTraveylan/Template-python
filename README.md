# Python Template

## Description

This is a Python project that uses pytest for testing and is configured for development in Visual Studio Code or cursor. It also includes a Dockerfile for containerization.

## Project Structure

The main application code is located in the `src` directory, with the entry point in `src/main.py`. The `src` directory also contains a `core` subdirectory for core functionality and an `utils` subdirectory for utilities.

The `tests` directory contains some basics stuffs for testing.

The `scripts` directory contains a dev tool to bump the version of the project, maybe it will be removed in the future to put it in a external package.

## Setup

### Requirements

- Python 3.13
- uv

### Installation

1. Clone the repository.
2. Install the dependencies:

```sh
uv sync
```

### Running the Application

To run the application:

```sh
uv run src/main.py
```

### Running the Tests

To run the tests:

```sh
pytest
```

## Docker

A Dockerfile is included for building a Docker image of the application. To build the image:

```sh
# Build the image (make sure to include the dot at the end)
docker build -t template-app .
```

To run the application in a Docker container:

```sh
# Basic run
docker run template-app

# Run with volume mount for development
docker run -v ${PWD}:/app template-app

# Interactive mode
docker run -it --rm template-app bash  
```

## Continuous Integration

The project includes a GitHub Actions workflow for continuous integration, which runs tests and security checks on push and pull request events to the main branch.

## Contributing

Contributions are welcome. Please submit a pull request or create an issue to discuss the changes.

## License

[MIT](LICENSE)