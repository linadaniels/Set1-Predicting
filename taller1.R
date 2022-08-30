library("rvest")

#url <- "https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_1.html"

#html <- read_html(url)
#html %>% html_elements(xpath = "//table") %>% html_table()
urldf<-c() 
for(x in 1:10){
  url <- paste0("https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_",x,".html", sep="")
  urldf[x]<-url
}
my_df1 <- as.data.frame(read_html(urldf[1])%>% html_elements(xpath = "//table") %>% html_table() )
my_df2 <- as.data.frame(read_html(urldf[2])%>% html_elements(xpath = "//table") %>% html_table() )
my_df3 <- as.data.frame(read_html(urldf[3])%>% html_elements(xpath = "//table") %>% html_table() )
my_df4 <- as.data.frame(read_html(urldf[4])%>% html_elements(xpath = "//table") %>% html_table() )
my_df5 <- as.data.frame(read_html(urldf[5])%>% html_elements(xpath = "//table") %>% html_table() )
my_df6 <- as.data.frame(read_html(urldf[6])%>% html_elements(xpath = "//table") %>% html_table() )
my_df7 <- as.data.frame(read_html(urldf[7])%>% html_elements(xpath = "//table") %>% html_table() )
my_df8 <- as.data.frame(read_html(urldf[8])%>% html_elements(xpath = "//table") %>% html_table() )
my_df9 <- as.data.frame(read_html(urldf[9])%>% html_elements(xpath = "//table") %>% html_table() )
my_df10 <- as.data.frame(read_html(urldf[10])%>% html_elements(xpath = "//table") %>% html_table() )

