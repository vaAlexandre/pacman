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
docker build . -t pacman
NEW_VERSION='0.1.12'
GITHUB_USERNAME='shuguet'
GITHUB_TOKEN='nice try'

docker tag ghcr.io/shuguet/pacman:${NEW_VERSION} ghcr.io/shuguet/pacman:latest
echo ${GITHUB_TOKEN} | docker login ghcr.io -u ${GITHUB_USERNAME} --password-stdin
docker push ghcr.io/shuguet/pacman:${NEW_VERSION}
docker push ghcr.io/shuguet/pacman:latest