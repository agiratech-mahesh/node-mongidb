FROM ubuntu:16.04
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
COPY . .
RUN apt update
RUN apt install -y nodejs
RUN apt install -y wget
RUN apt-get install -y apt-transport-https ca-certificates
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update
RUN apt-get install -y mongodb 
CMD service mongodb start ; nodejs index.js
