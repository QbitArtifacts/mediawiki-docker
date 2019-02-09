#!/bin/bash

envsubst < LocalSettings.php.dist > /etc/mediawiki/LocalSettings.php

apache2ctl -DFOREGROUND
