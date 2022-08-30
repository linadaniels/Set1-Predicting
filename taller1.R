library("rvest")

url <- "https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_1.html"

html <- read_html(url)

html %>% html_elements(xpath = "//table") %>% html_table()

##hola lina como estas
