library(dplyr)
electr1 <- read_excel("200000935052-electricity-19-10-18-to-19-10-20.xlsx", sheet = 1)
electr2 <- read_excel("200000935052-electricity-19-10-18-to-19-10-20.xlsx", sheet = 2)

write.csv(electr2, file="electr2.csv")
electr3 <- read.csv("electr3.csv")
names(electr3)
head(electr3)
tail(electr3)
str(electr3)

cons <- electr3 %>% 
  filter(UsageType == "Consumption") %>%
  filter(From == "2020-10-19T19:00:00" | From == "2020-10-19T19:30:00")
  mutate_at(vars(UsageType), as.factor)
  
table(cons$AmountUsed)  
dim(cons)
cons_sum <- cons %>%
  select(AmountUsed)

colSums=colSums(cons_sum)
colSums
