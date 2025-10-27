#!/bin/bash

echo "Running tests"

# käynnistetään Flask-palvelin taustalle
poetry run python3 src/index.py &

echo "started Flask server"

# odetetaan, että palvelin on valmiina ottamaan vastaan pyyntöjä
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:5001)" != "200" ]];
  do sleep 1;
done

echo "Flask server is ready"

# suoritetaan testit
poetry run robot --variable HEADLESS:true src/tests

status=$?

# pysäytetään Flask-palvelin portissa 5001
kill $(lsof -t -i:5001)

exit $status
