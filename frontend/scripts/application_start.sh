#!/bin/bash

# sudo wget -O /var/www/html/app.js https://raw.githubusercontent.com/fredritchie/3-tier-CICD/main/frontend/app.js
aws s3 cp s3://my-tf-hypha-ritchie-bucket/* /var/www/html/

npm install express
npm install aws-sdk 
# Run the Express.js app using PM2
sudo pm2 stop all
sudo pm2 start /var/www/html/app.js

# Save PM2 process list to automatically start at boot
sudo pm2 save