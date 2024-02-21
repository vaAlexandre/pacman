#!/usr/bin/env bash
# 
# @Author: shuguet <sylvain@huguet.me>
# @Date: 2024-02-21 13:51:11 
# @Last Modified by:   shuguet <sylvain@huguet.me>
# @Last Modified time: 2024-02-21 13:51:11 
#
# Description: 
# Helper script to publish the Pac-Man container image app (Node.js version with MongoDB Bitnami chart)
#
# Required tools:
#   - docker
NEW_VERSION='0.1.13'
GITHUB_USERNAME='shuguet'
GITHUB_TOKEN='nice try'

docker build . -t pacman
docker tag pacman ghcr.io/shuguet/pacman:${NEW_VERSION}
docker tag pacman ghcr.io/shuguet/pacman:latest
echo ${GITHUB_TOKEN} | docker login ghcr.io -u ${GITHUB_USERNAME} --password-stdin
docker push ghcr.io/shuguet/pacman:${NEW_VERSION}
docker push ghcr.io/shuguet/pacman:latest