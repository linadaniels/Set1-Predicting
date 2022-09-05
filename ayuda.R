#taller 1
library("rvest")
library ("vtable")
library("kableExtra")
library("tidyverse")

##Obtencion de datos a traves de scraping de la pagina que nos da el enunciado
#Datos de la Gran encuesta integral de hogares (GEIH 2018)

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

#ahora se eliminan los menores de edad
df = subset(df, age > 18)
df

  #vamos a eliminar las variables no necesarias para el modelo
keeps<-c("age","clase","college","dsi","formal","y_total_m","maxEducLevel","sex")
df=df[keeps]
df
#eliminamos los ingresos iguales a 0
#df = subset(df, y_total_m == NA)
df %>% drop_na(y_total_m)
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
#library(ggplot2)

#ggplot(
#df,
# aes(edad,directorio)
#)+
# geom_point()+
#  geom_smooth(df=cbind(df,agec)
#  method = "lm",
#   se =FALSE
#  )

#regresiones
#Primero hacemos la regresion con la edad
install.packages("apaTables")
library(apaTables)
agec<-df$age*df$age

regage<-lm(y_total_m ~ age+agec, data = df)
summary(regage)$coefficient
apa.reg.table(regage, filename= "regresionedad.doc", table.number= 1)

#ahora hacemos la regresion con genero

df$fem<-ifelse(df$sex==1,0,1)
df$log_ing<-log(df$y_total_m)
regfem<-lm(log_ing ~ fem, data = df)
summary(regfem)$coefficient
apa.reg.table(regage, filename= "regresiongenero.doc", table.number= 1)
#para el punto 6 de las 3 regresiones se hara asi
regult<-lm(log_ing ~ fem+age+formal+dsi+, data = df)
summary(regfem)$coefficient
apa.reg.table(regage, filename= "regresiongenero.doc", table.number= 1)