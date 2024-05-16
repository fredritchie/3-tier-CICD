#!/bin/bash

sudo wget -O /var/www/html/app.js https://raw.githubusercontent.com/fredritchie/3-tier-CICD/blob/main/app-code/app.js
npm install express
npm install aws-sdk 
# Run the Express.js app using PM2
pm2 stop all
pm2 start /var/www/html/app.js

# Save PM2 process list to automatically start at boot
pm2 save