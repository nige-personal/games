#!/bin/bash
set -e

    if [[ $1 == *"--production"* ]] ;then
      docker tag $2 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:prod-$3
      if [[ $4 == *"--push"* ]] ;then
        docker push 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:prod-$3
      fi
    fi

    if [[ $1 == *"--development"* ]] ;then
      docker tag $2 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:dev-$3
      if [[ $4 == *"--push"* ]] ;then
        docker push 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:dev-$3
      fi
    fi