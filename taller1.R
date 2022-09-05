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

df = rbind(my_df1,my_df2, my_df3,my_df4,my_df5, my_df6, my_df7, my_df8, my_df9, my_df10)
df
#ahora se eliminan los menores de edad
df = subset(df, age > 18)
df
#vamos a eliminar las variables no necesarias para el modelo
keeps<-c("age","clase","college","depto","dsi","formal","ingtot","ingtotob","maxEducLevel","ocu","pet","sex")
df=df[keeps]
df
df = subset(df, - df = NA)

## mostrar estructura
str(df)

##  descriptive statistics table. 
install.packages("vtable")
library(vtable)
sumtable(df)
st(df)

## out
data(df)
sumtable(df)
vartable <- vtable(df,out='return')

##into my LaTeX doc:
vt(df, out='latex',file='mytable1.tex')

data(df)
st(df,file='df')


##reg
library(ggplot2)

ggplot(
  df,
  aes(edad,directorio)
)+
  geom_point()+
  geom_smooth(
    method = "lm",
    se =FALSE
  )
