#!/bin/bash

if [ -z '$ASSET_TO_CALCULATE' ]
then
        echo 'Please set the ASSET_TO_CALCULATE environment variable'
        exit -1
fi

#Create a virtualenv if it doesnt exist
if [ ! -d "./env" ]; then
        virtualenv -p python3 env
        source env/bin/activate
        pip install -r requirements.txt
        mkdir -p notebooks/input
        mkdir -p notebooks/output
else
        source env/bin/activate
fi

#Load the virtualenv created

export PYTHONPATH=$PYTHOPATH:$PWD:$PWD/notebooks
export SWISSEPH_PATH=$PWD/pyastrotrader/swisseph

#Start the jupyter lab...
cd notebooks
jupyter lab --ip='*' --port=8080 --no-browser
