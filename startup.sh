#!/bin/bash

su -s /bin/bash elastic -c "/usr/share/elasticsearch/bin/elasticsearch&"

su -l elastic
