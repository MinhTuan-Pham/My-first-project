outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
names(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])
outcome$State


#Function 1
#datc is data column in each condition
best <- function(state, outcome) {
  dat <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  locate <- numeric()
  datc <- numeric()
  if (!any(state == dat$State)) {
    stop("invalid state")
  }
  
  if (!any(outcome == c("heart attack","heart failure","pneumonia"))) {
    stop("invalid outcome")
  }
  
  if (outcome == "heart attack") {
    datc <- 11
  }
  if (outcome == "heart failure") {
        datc <- 17
        }
  if (outcome == "pneumonia") {
          datc <- 23
  }
  locate <- which(dat[, datc] == min(dat[, datc], na.rm = TRUE))
  return(dat[locate,"Hospital.Name"])
}
best("AL","heart attack")
best("TX", "heart attack")
best("TX", "heart failure")
