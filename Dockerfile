FROM node:16

# Create app directory
WORKDIR /

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
RUN apt-get update
RUN apt-get install python default-jre-headless python-tk python-pip python-dev libxml2-dev libxslt-dev zlib1g-dev net-tools -y
RUN pip install bzt
RUN bzt -v
COPY package*.json .

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . .

WORKDIR /src

CMD [ "node", "index.js" ]