# This Dockerfile will: 
# set up a Golang environment(using the Golang Docker Image)
# and install the Go Relayer

# Use Golang Docker Image
FROM golang:1.20

# Set working dir
WORKDIR /home/rly

# Install git
RUN apt-get install git

# Clone relayer repository and install relayer
RUN git clone https://github.com/cosmos/relayer.git && cd relayer && git checkout v2.3.0 && make install

# Copy configs
ADD chains /home/rly/configs

# Copy pahts
ADD paths /home/rly/paths

# Copy entrypoint script
COPY ./run-relayer.sh /home/rly/

# Copy env file
COPY .env /home/rly/

# Set permission
# RUN chmod +x ./run-relayer.sh