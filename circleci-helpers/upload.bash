#!/bin/bash
BRANCH=$1

echo -n "Working dir: "
pwd

function production {
  echo "Running production.."
  aws s3 sync build/ s3://www.artrunde.com --delete --exclude "*.png"
  aws s3 sync build/ s3://assets.artrunde.com --exclude "*" --include "images/*"	
}

function development {
  echo "Running development..."
  aws s3 sync build/ s3://dev-www.artrunde.com --delete --exclude "*.png"
  aws s3 sync build/ s3://dev-assets.artrunde.com --exclude "*" --include "images/*"	
}

if [[ $BRANCH == "prd" ]]
then
  production
fi

if [[ $BRANCH == "dev" ]]
then
  development
fi

echo "Done..."




