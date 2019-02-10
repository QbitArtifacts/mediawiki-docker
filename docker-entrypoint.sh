#!/bin/bash

envsubst '${WIKI_NAME},${WIKI_URL},${WIKI_DOMAIN},${WIKI_SECRET_KEY},${WIKI_UPGRADE_KEY}' < /wikiconf/LocalSettings.php.dist > /etc/mediawiki/LocalSettings.php

apache2ctl -DFOREGROUND
