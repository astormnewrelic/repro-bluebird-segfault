FROM amazonlinux:2.0.20190823.1
RUN yum -y install tar gzip git

RUN touch ~/.profile
# RUN nvm install 10.16.3

# from: https://gist.github.com/remarkablemark/aacf14c29b3f01d6900d13137b21db3a

RUN mkdir -p /usr/local/nvm

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.16.3

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

RUN git clone https://github.com/astormnewrelic/repro-bluebird-segfault

WORKDIR /repro-bluebird-segfault
RUN npm install
