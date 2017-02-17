#!/bin/bash
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

if [[ $CIRCLE_BRANCH == "master" ]]
then
  production
fi

if [[ $CIRCLE_BRANCH == "development" ]]
then
  development
fi

echo "Done..."




