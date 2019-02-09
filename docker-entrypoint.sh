#!/bin/bash

envsubst < LocalSettings.php.dist > /var/lib/mediawiki/LocalSettings.php

apache2ctl -DFOREGROUND
