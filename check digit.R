#UPC check digit code
upc_check_digit <- function(series)  {
  
  reverse <- rev(series)[-1]
  
  i <- 1:length(reverse)
     yo <- reverse[i%%2 != 0]
     ye <- reverse[i%%2 == 0]
  
  odd <- sum(yo)
  even <- sum(ye)
  result <- odd*3 + even
  
  if (result %% 10 == 0) {
    check_digit <- 0 
  } else { check_digit <- 10 - (result %% 10)}
  
  check_digit
}

upc_check_digit(c(0,3,6,0,0,0,2,4,1,4,5,7))
