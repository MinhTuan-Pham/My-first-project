#UPC check digit code
upc_check_digit <- function(series)  {
  
  odd <- numeric()
  even <- numeric()
  result <- numeric()
  check_digit <- numeric()
  reverse <- numeric()
  yo <- numeric()
  ye <- numeric()
  
  reverse <- rev(series)[-1]
  
  for (i in 1:length(reverse)) {
     yo <- reverse[i%%2 != 0]
     ye <- reverse[i%%2 == 0]
  }
  odd <- sum(yo)
  even <- sum(ye)
  result <- odd + even
  
  ifelse((result %% 10) == 0, check_digit <- 0, check_digit <- 10 - (result %% 10))
  
  check_digit
}

upc_check_digit(c(0,3,6,0,0,0,2,4,1,4,5,7))