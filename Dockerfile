FROM ubuntu
COPY ./app /app
WORKDIR /app

RUN apt-get update \
&& apt-get install -y openjdk-8-jdk \
&& apt-get install -y maven 

RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar \
&& mvn package

ENTRYPOINT java -Djava.library.path=lib/ubuntuupperthan18/ -jar target/fatjar-0.0.1-SNAPSHOT.jar