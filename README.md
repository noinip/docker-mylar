This is a Dockerfile setup for mylar - https://github.com/evilhero/mylar

To run:

```
docker run -d --name="mylar" -v /path/to/mylar/data:/config -v /path/to/downloads:/downloads -v /path/to/comics:/comics -v /etc/localtime:/etc/localtime:ro -p 8090:8090 pinion/docker-mylar
```

Much donate: DR5dCKF8m5x8VWMtofpGoH4ghjNZYywgTU
I also like tacos if anyone cares.
