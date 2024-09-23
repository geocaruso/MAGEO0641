#R script to scrape the tour de France winners table from wikipedia page:
#https://en.wikipedia.org/wiki/List_of_Tour_de_France_general_classification_winners
#Geoffrey Caruso  Sept 18th 2024
#
# Script is adapted from
# https://help.displayr.com/hc/en-us/articles/360003582875-How-to-Import-a-Wikipedia-Table-using-R
# 
# Since there are different tables in Tour de France page and the one of interest is a sortable one,
# I have adapted following suggestions in
# 
# https://stackoverflow.com/questions/72380279/how-to-scrape-with-table-class-name-with-r
# 
# I still had to look into the source of the table to find out what table class this is
# In this case it was a "wikitable plainrowheaders sortable'

LeTour_url<-"https://en.wikipedia.org/wiki/List_of_Tour_de_France_general_classification_winners"
LeTour_Page<-rvest::read_html(LeTour_url)
LeTour_Table<-rvest::html_node(LeTour_Page, xpath="//table[@class='wikitable plainrowheaders sortable']")
LeTour_Tibble = rvest::html_table(LeTour_Table, fill = TRUE)
LeTour_df<-as.data.frame(LeTour_Tibble)

saveRDS(LeTour_df,"data/TourDeFrance/LeTour_df.rds")

