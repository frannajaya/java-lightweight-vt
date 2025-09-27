# Java Spring Boot Test On 1 CPU and 256Mb Memory

This project demonstrates how to set up a simple Java Spring Boot application (using java 21 and the
Virtual Thread) and run the system in 1 CPU and 256Mb memory. It includes basic configurations,
dependencies, and test cases to ensure the application works as expected.

## Prerequisites

- Java Development Kit (JDK) 21 or higher
- Spring Boot 3.3 or higher
- Maven 3.6 or higher
- Docker
- Git

## How to Run the System

### Running with Docker

1. Build the Docker image:
   ```bash
   docker build -t java-lightweight-vt .
   ```

2. Run the Docker container with limited resources:
   ```bash
   docker run -d --name java-lightweight-vt-container -p 2000:2000 --memory="256m" --cpus="1" java-lightweight-vt
   ```

3. Access the application at `http://localhost:2000/hello`.

### Running With Docker Compose

1. Ensure you have Docker Compose installed.
2. Run the following command to start the service:
   ```bash
   docker-compose up -d
   ```

3. Access the application at `http://localhost:2000/hello`.

** Side note: You can adjust the memory and CPU limits in the `docker-compose.yml` file as needed.

## Testing

1. Go to k6-script directory
   ```bash
   cd k6-script
   ```

2. Run the tests using k6:
   ```bash
   k6 run test_call_hello.js
   ```

## Test Result

Here is the example of the test result I've tried on my local machine using that setup 1 CPU and
256Mb memory:

[k6 test image](/test-result/Screenshot%202025-09-27%20at%2017.29.04.png)

[k6 test video](/test-result/Screen%20Recording%202025-09-27%20at%2017.28.11.mov)

### Copyright

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details