#!/bin/bash

# Copy over post processing if it isn't there
if [ -d "/config/post-processing/" ]; then 
	exec /sbin/setuser nobody python /opt/mylar/Mylar.py --datadir=/config
  else
	exec cp -R /opt/mylar/post-processing/ /config/
	exec /sbin/setuser nobody python /opt/mylar/Mylar.py --datadir=/config
  fi
fi


