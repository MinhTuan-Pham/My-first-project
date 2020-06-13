vector <- c(seq(1,5, by=1))
sum(vector^2)

#Use Pipe
library(magrittr)
c(seq(1,5,by=1))^2 %>% sum()

#Check calculating speed
start.time <- Sys.time()
vector <- c(seq(1,5, by=1))
sum(vector^2)
end.time <- Sys.time()
end.time - start.time

#Another Pipe
df <- data.frame(a=c(1,2,3,4), b=c(5,6,7,8))
df %>% sum(a)
df %>% sum()
df %$% sum()
df %$% sum(a)
attach(df)
df
sum(a)

#summarize and group_by with Pipe
library(magrittr)
library(dplyr)
iris %>% subset(Sepal.Length > 4) %>% group_by(Species) %>% 
  summarise(Avg.Length = mean(Sepal.Length), Avg.Width = mean(Sepal.Width))
iris %>% distinct(Species)
iris %<>% subset(Species %>% equals("setosa"))
iris %>% distinct(Species)

set.seed(1)
sampleWithReplace <- function(v,n=100) sample(v, size = n, replace = TRUE)
auction.data <-
  data.frame(
    Price = 1:100 %>% sampleWithReplace,
    Quantity = 1:100 %>% sampleWithReplace,
    Type = 
      0:1 %>% 
      sampleWithReplace %>% 
      factor(labels = c("Buy","Sell"))
  )
head(auction.data)

#Condition with data frame
library(magrittr)
library(dplyr)
subIris <- iris[iris$Species == "Setosa",]
head(subIris)
subIris
iris
subIris <- iris[iris$Species == "setosa",]
subIris
head(subIris)
subIris %>% distinct(Species)
head(iris[iris$Species == "setosa", 1:3])
subIris <- iris[and(iris$Species == "setosa", iris$Sepal.Length > 5),]
distinct(subIris,Species)
min(subIris$Sepal.Length)
iris[10:20,]

#Filter
subIris <- filter(iris,Sepal.Length > 5)
min(subIris$Sepal.Length)

subIris <- filter(iris,and(Species == "setosa", Sepal.Length >5))
distinct(subIris,Species)

#subset
subIris <- subset(iris,and(Species == "setosa", Sepal.Length>5))
subIris
distinct(subIris,Species)

#sql
library(sqldf)
subMtcars <- sqldf('SELECT * FROM mtcars WHERE mpg >15 AND disp > 150')
min(subMtcars$disp)
subMtcars

#new Environment in data frame
iris %<>% mutate(Type = ifelse(Sepal.Length+Sepal.Width > 8, "Height","Small"))
iris %>% filter(Sepal.Length+Sepal.Width > 8) %>% distinct(Type)
iris %>% filter(Sepal.Length+Sepal.Width <= 8) %>% distinct(Type)

#sapply
sapply(1:5, function(x) {x^2})
lapply(1:5, function(x) {x^2})

ftype <- function(x) {
  ifelse(x>8, "Big","Small")
}
ftype(5)
iris$Type <- iris %$% unlist(lapply(Sepal.Length+Sepal.Width, ftype))
head(iris,10)
