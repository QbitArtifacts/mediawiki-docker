#!/bin/bash

envsubst < /wikiconf/LocalSettings.php.dist > /etc/mediawiki/LocalSettings.php

apache2ctl -DFOREGROUND
