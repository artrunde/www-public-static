#!/bin/bash
bundle exec middleman build --verbose --environment=$CIRCLE_BRANCH
