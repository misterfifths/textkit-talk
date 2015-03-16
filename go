#!/bin/bash

python -m SimpleHTTPServer 8080 &
open 'http://localhost:8080/slides.html'
read
kill %1