#######################################
# 
#  README.md file for Project:  Docker Radicale
#
######################################
# Brief discription of the project
#
# This appears under TASKS.md file
#
#  Table of Contents:
#  
#  * Overview
#  * Features
#  * Installation
#  * Configuration
#  * License
#
######################################

# Features:

1. Dockerfile is used to install needed packages based on Alpine
   configuring working directory, copy the entrypoint.sh and giving permissions to allow running, 
   and expose radicale port 5232.
2. Dockercompose.yml configuring port, user and password for radicale (taken from .env file) and specify volume.
3. entrypoint.sh, if users file exist will skip it, else will start by checking user and password exist in .env file
4. radicale.conf file for radicale settings (how users prove identity and who can access their data, auth method)

# Installation
1. Make sure you have docker and docker compose installed 
2. Please clone this repository to where you want to run this.
3. Create .env file (please check Configuration section for this)
4. Run: docker compose up -d
5. in order to scale up e.g:  docker compose up -d --scale radicale=2 (if you want 2)
6. in order to scale down e.g:  docker compose up -d --scale radicale=1 (if you want only 1)
   
# Configuration
1. In .env file please set the following:
    RADICALE_USER="YOURUSERNAME"
    RADICALE_PASSWORD="YOURPASSWORD"
    RADICALE_IMAGE=thundercats12/radicalev3:stable   (or other version)
    RADICALE_PORT=5232


# License Info
This project is licensed under the MIT License - see the LICENSE file for more detailes