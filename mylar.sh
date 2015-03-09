#!/bin/bash

# Copy over post processing if it isn't there
if [ -d "/config/post-processing/" ]; then 
	# do nothing
  else
	exec cp -R /opt/mylar/post-processing/ /config/
  fi
fi

exec /sbin/setuser nobody python /opt/mylar/Mylar.py --datadir=/config
