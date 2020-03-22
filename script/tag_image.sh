#!/bin/bash
set -e

    if [[ $1 == *"--prod"* ]] ;then
      docker tag prod_games:latest 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:prod-$2
      if [[ $3 == *"--push"* ]] ;then
        docker push 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:prod-$2
      fi
    fi

    if [[ $1 == *"--dev"* ]] ;then
      docker tag dev_games:latest 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:dev-$2
      if [[ $3 == *"--push"* ]] ;then
        docker push 702275590140.dkr.ecr.eu-west-1.amazonaws.com/games:dev-$2
      fi
    fi