#!/bin/bash
set -e

    if [[ $@ == *"--prod"* ]] ;then
    shopt -s nullglob
      files=(log/*)
      if (( ${#files[*]} )); then
        echo 'Removing log files....................'
        rm -r log/*
      fi
      shopt -u nullglob
      # echo ''
      # echo '***********************************************************************'
      # echo '####           Logging in to AWS with eb-cli credentials          #####'
      # echo '***********************************************************************'
      # echo ''
      # eval "$(aws ecr get-login --profile eb-cli  --no-include-email --region eu-west-1)"
      echo ''
      echo '*****************************************************************************************************************************************************************************************************************'
      echo '          Building the command to run on the container'
      command="RAILS_ENV=production bundle exec rake assets:precompile && RAILS_ENV=production bundle && RAILS_ENV=production bundle exec rake db:migrate && RAILS_ENV=production bundle exec rails s -p 3000 -b '0.0.0.0'"
      echo $command
      echo '*****************************************************************************************************************************************************************************************************************'
      echo ''
      docker build --build-arg APP_DIR=myapp --build-arg COMMAND="$command" -t=games .
      echo ''
      echo ''
      echo '***********************************************************************'
      echo '                Docker image built, all done......'
      echo '***********************************************************************'
      echo ''
    fi

    if [[ $@ == *"--dev"* ]] ;then
      shopt -s nullglob
      files=(log/*)
      if (( ${#files[*]} )); then
        echo 'Removing log files....................'
        rm -r log/*
      fi
      shopt -u nullglob
      # echo ''
      # echo '***********************************************************************'
      # echo '####          Logging in to AWS with eb-cli credentials           #####'
      # echo '***********************************************************************'
      # echo ''
      # eval "$(aws ecr get-login --profile eb-cli  --no-include-email --region eu-west-1)"
      echo ''
      echo '*********************************************************************************************************************************'
      echo '             Building the command to run on the container'
      command="RAILS_ENV=development bundle exec rake db:create db:migrate && RAILS_ENV=development bundle exec rails s -p 3000 -b '0.0.0.0'"
      echo $command
      echo '*********************************************************************************************************************************'
      echo ''
      docker build --build-arg APP_DIR=myapp --build-arg  COMMAND="$command" -t=games .
      echo ''
      echo ''
      echo '***********************************************************************'
      echo '                Docker image built, all done......'
      echo '***********************************************************************'
      echo ''
    fi