This is a Dockerfile setup for mylar - https://github.com/evilhero/mylar  

I've also added ComicTagger... but it might not be working... 
It's in the same place as where mylar is installed so it should just work if you enable tagging in the config. If you have to put in the directory it's at /opt/mylar. Technically I check it out to /opt/comictagger and then copy it to mylar. Works For Me (tm)

To run:

```
docker run -d --name="mylar" -v /path/to/mylar/data:/config -v /path/to/downloads:/downloads -v /path/to/comics:/comics -v /etc/localtime:/etc/localtime:ro -p 8090:8090 pinion/docker-mylar
```

Much donate: DR5dCKF8m5x8VWMtofpGoH4ghjNZYywgTU  
100% more bitcoin! 17bmSNaEBrD5Li8NSVT5WMTV57tTrubCj7  
I also like tacos if anyone cares.
