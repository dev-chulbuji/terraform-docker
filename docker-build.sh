#!/bin/sh

VERSION=$(cat VERSION)

docker build -t alpine-terraform:$VERSION -f Dockerfile .
