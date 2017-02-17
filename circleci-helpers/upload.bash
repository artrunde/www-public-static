#!/bin/bash
ENVIRONMENT=$1

echo -n "Working dir: "
pwd

function production {
  echo "Running prd.."
  aws s3 sync ../build/ s3://www.artrunde.com --delete --exclude "*.png"
  aws s3 sync ../build/ s3://assets.artrunde.com --exclude "*" --include "images/*"	
}

function development {
  echo "Running dev..."
  aws s3 sync ../build/ s3://dev-www.artrunde.com --delete --exclude "*.png"
  aws s3 sync ../build/ s3://dev-assets.artrunde.com --exclude "*" --include "images/*"	
}

if [[ $ENVIRONMENT == "prd" ]]
then
  production
fi

if [[ $ENVIRONMENT == "dev" ]]
then
  development
fi

echo "Done..."




