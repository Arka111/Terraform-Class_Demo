#! /bin/bash

# Install and start nginx
sudo apt-get update && sudo apt-get install -y nginx
sudo service nginx start

# Copy website assets from S3
aws s3 cp s3://${s3_bucket_name}/website/index.html /home/ubuntu/index.html
aws s3 cp s3://${s3_bucket_name}/website/Globo_logo_Vert.png /home/ubuntu/Globo_logo_Vert.png

# Replace default website with downloaded assets
sudo rm /usr/share/nginx/html/index.html
sudo cp /home/ubuntu/index.html /usr/share/nginx/html/index.html
sudo cp /home/ubuntu/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png
