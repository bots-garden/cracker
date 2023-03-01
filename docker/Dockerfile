# Create a Java runtime
FROM eclipse-temurin:19 as jre-build

RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base,java.logging,java.net.http \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

# Install Extism
FROM debian:stable-slim as extism-install

RUN apt-get update -y
RUN apt-get install git -y
RUN apt install -y pkg-config
RUN apt install python3-pip -y
RUN pip3 install poetry
RUN pip3 install git+https://github.com/extism/cli

ENV EXTISM_HOME="${HOME}/.local"
ENV PATH "${EXTISM_HOME}/bin:${PATH}"

RUN extism install latest

# Create wasm runner image
FROM debian:buster-slim

ENV LD_LIBRARY_PATH="/usr/local/lib"

COPY --from=extism-install /usr/local/lib/libextism.so /usr/local/lib/libextism.so
COPY --from=extism-install /usr/local/include/extism.h /usr/local/include/extism.h

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME

# Continue with your application deployment
RUN mkdir /opt/app
RUN mkdir /opt/app/tmp
COPY starter-1.0.0-SNAPSHOT-fat.jar /opt/app

EXPOSE 8080

CMD ["java", "-jar", "/opt/app/starter-1.0.0-SNAPSHOT-fat.jar"]

# export WASM_FILE="./tmp/hello-go.wasm"
# export HTTP_PORT="8080"
# export FUNCTION_NAME="helloWorld"
# export WASM_REGISTRY="gitlab.com"
# export WASM_PACKAGE="go_wasm_io"
# export WASM_VERSION="0.0.1"
# export WASM_MODULE="hello-go.wasm"
# export GITLAB_WASM_PROJECT_ID="43900010"
# export WASM_URI="/api/v4/projects/${GITLAB_WASM_PROJECT_ID}/packages/generic/${WASM_PACKAGE}/${WASM_VERSION}/${WASM_MODULE}"

# java -jar /opt/app/starter-1.0.0-SNAPSHOT-fat.jar