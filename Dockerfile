# Run on cmd from this directory:
#  - docker image build -t cloud-inventory .
#  - docker container run --rm -p 8080:8080 --name ci-instance cloud-inventory
# Go to http://localhost:8080 to test

FROM vertx/vertx3

ENV MAIN_CLASS_NAME pt.netissues.cloudinventory.Test
ENV JAR_FILE build/libs/cloud-inventory-1.0-SNAPSHOT.jar
ENV CONTAINER_HOME /usr/cloudinventory

EXPOSE 8080

# Copy your verticle to the container
COPY $JAR_FILE $CONTAINER_HOME/

# Launch the verticle
WORKDIR $CONTAINER_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec vertx run $MAIN_CLASS_NAME -cp $CONTAINER_HOME/*"]