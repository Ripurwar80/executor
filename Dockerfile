FROM nikolaik/python-nodejs:python3.11-nodejs19

# Create app directory
WORKDIR /

# RUN yum install nodejs npm
# RUN yum install python3 py3-pip gcc openjdk11
# RUN apk add python3 default-jre-headless python3-tk python3-pip python3-dev libxml2-dev libxslt-dev zlib1g-dev net-tools
# RUN pip3 install --upgrade wheel setuptools Cython cryptography fuzzyset lxml numpy psutil cffi python-levenshtein
RUN pip3 install cython bzt
RUN pip3 freeze 

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+) 


COPY package*.json .

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . .

WORKDIR /src

CMD [ "node", "index.js" ]