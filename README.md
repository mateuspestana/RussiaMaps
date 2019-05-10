# RussiaMaps
Maps of the Russian Federation and its states' boundaries

### About the maps

Here are the maps of the Russian Federation, updated by [@Kreozot](https://github.com/Kreozot/russian-geo-data)'s "russia-geo-data" repository, and processed by me into R, correcting some problems. 

The original shapefile is from http://gadm.org/ and was edited by Kreozot, updating it to include the new regions and the merged states:

- Crimea and Sevastopol
- Perm Krai (Perm Oblast + Komi-Permyak Autonomous Okrug)
- Krasnoyarsk Krai (Krasnoyarsk Krai + Evenk Autonomous Okrug + Taymyr Autonomous Okrug)
- Kamchatka Krai (Kamchatka Oblast + Koryak Autonomous Okrug)
- Irkutsk Oblast (Irkutsk Oblast + Ust-Orda Buryat Autonomous Okrug)
- Zabaykalsky Krai (Chita Oblast + Agin-Buryat Autonomous Okrug)

I imported the geoJSON and corrected the problem of Negative Coordinates (which made the Chukotka Region appears on the west of the world). Then I exported both the script and the fortified RData (and the original file). Everything is available in this repo. 

### Initial maps: 

[Path](png/map_path.png)
[Polygon](png/map_polygon.png)