library(rvest)
library(httr)
library(jsonlite)
library(purrr)



response<-httr::GET(url = "https://api.ptcp.vn/indexs/ticker")

if(httr::status_code(response) == 200) {
  response %>% httr::content(x = )
}

httr::status_code(response) == 200
list_api <- list(
  "top50" = "https://api.ptcp.vn/stocks/top50",
  "vn30" = httr::modify_url(url = "https://api.ptcp.vn/indexs/ticker", query = list("index" = "VN30")),
  "vn100" = httr::modify_url(url = "https://api.ptcp.vn/indexs/ticker", query = list("index" = "VN100"))  
)

list_api %>% 
purrr::map(~ httr::GET(.) %>% httr::content(x=., as = "text") %>% jsonlite::fromJSON(.) %>% .[["data"]] %>% tibble::as.tibble(.))

list_api %>% 
  purrr::map(~ httr::GET(.) %>% httr::status_code(.) == 200)






stock50 <- httr::GET(url = "https://api.ptcp.vn/stocks/top50")

  stock50 %>% httr::content(as = "text") %>% jsonlite::fromJSON() %>% .[["data"]] %>% tibble::as.tibble(.)
  
  stockindex <- httr::GET(url = "https://api.ptcp.vn/indexs/ticker")
stock50 %>% httr::content(as = "text") %>% jsonlite::fromJSON() %>% .[["data"]] %>% tibble::as.tibble(.)
index_vn30 <- httr::GET(url = "https://api.ptcp.vn/indexs/ticker?index=VN30") %>% httr::content(as = "text") %>% jsonlite::fromJSON() %>% .[["data"]] %>% tibble::as.tibble(.)
index_vn30
