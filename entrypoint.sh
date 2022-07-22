#!/bin/bash
set -e

cd m3o-dart
WORK_DIR=$(pwd)

echo "dart-publisher-action-> Working directory ${WORK_DIR}"

ls -al

echo 'dart-publisher-action-> dary run dart publish'
dart pub lish --dry-run
if [ ! $? -eq 0 ]
then
    echo 'dry run has faild'
    exit 1
fi

echo 'dart-publisher-action-> setting up pub-credentials.josn file ...'
mkdir -p ~/.config/dart
echo "${INPUT_PUB_CREDENTIALS}" > ~/.config/dart/pub-credentials.json

echo 'dart-publisher-action-> publishing m3o-dart to pub.dev ...'

if [ ! -f ~/.config/dart/pub-credentials.json ]
then
    echo "missing credentials"
    exit 1
fi

dart pub lish -f

if [ $? -eq 0 ]
then
    echo 'dart-publisher-action-> delete pub-credentials.json'
    rm ~/.config/dart/pub-credentials.json
    echo "::set-output name=success::true"
else
    echo 'dart-publisher-action-> delete pub-credentials.json'
    rm ~/.config/dart/pub-credentials.json
    echo "::set-output name=success::false"
fi


