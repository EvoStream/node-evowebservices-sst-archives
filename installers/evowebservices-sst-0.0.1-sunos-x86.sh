#!/bin/sh
#
# Script to install node JS, ERS dependencies, and the actual ERS code.
#

# Get the needed parameters
OS=sunos
ARCH=x86
VER=4.1.1
NODE_JS=http://nodejs.org/dist/v$VER/node-v$VER-$OS-$ARCH.tar.gz

# Download and extract needed node JS
which node
if [ $? != 0 ]; then 
    echo "Node.js DOES NOT exists.... Installing Node.js first...." 

    wget $NODE_JS 

    # Next, execute the following command to install the Node.js binary package in /usr/local/:
    tar zxf node-v$VER-$OS-$ARCH.tar.gz -C /usr/local --strip-components 1 
    if [ $? != 0 ]; then echo 'Node.js: INSTALLATION FAILED! Please see errors below:'; exit 1; fi
    
    echo "Node.js: SUCCESSFUL INSTALLATION!" 

    
else
    echo "Node.js already exists" 
fi 

# Install evowebservices-sst
echo 'Installing NPM evowebservices-sst...'
npm install https://github.com/EvoStream/node-evowebservices-sst/tarball/master
if [ $? != 0 ]; then echo 'evowebservices-sst: INSTALLATION FAILED! Please see errors below:'; exit 1; fi

echo "evowebservices-sst: SUCCESSFUL INSTALLATION!" 

# Change to where evowebservices-sst is
cd node_modules/evowebservices-sst

# Start evowebservices-sst
echo 'Starting evowebservices-sst...'
npm start 
if [ $? != 0 ]; then echo 'Could not start evowebservices-sst!'; exit 1; fi

exit 0;