#!/bin/bash

git submodule update --init
cd gluon-site
git pull origin main
cd ..
git add gluon-site
git commit -m "Updated gluon-site from origin/main"
