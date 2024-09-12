#Ferguson Rob,
#linear regression in geography, CATMOG 15. https://github.com/qmrg/CATMOG/blob/Main/15-linear-regression-in-geography.pdf

#Data from Table 1 and 2, p8:
#Average precipitation and elevation across southern Scotland
#
#Source caption: British Rainfall (HMSO),
#selected raingauges between national grid lines 600 and 601 km N.
#Sites are in West-East order
#Elevation in m above OD
#Rainfall in mm/yr
#DistanceE in km from W coast
#
RainScotland<-data.frame(
  SiteNo=1:20,
  Elevation=c(240,430,420,470,300,150,520,460,300,410,
              140,540,280,240,200,210,160,270,320,230),
  Rainfall=c(1720,2320,2050,1870,1690,1250,2130,2090, 1730,2040,
             1460,1860,1670,1580,1490,1420,900,1250,1170,1170),
  DistanceE=c(37,43,48,49,52,59,73,75,76,77,
              86,97,100,103,104,114,138,152,153,154)
    )
write.csv(RainScotland, "data/Ferguson/RainScotland.csv")
