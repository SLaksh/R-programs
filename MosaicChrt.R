data()
## working on the UCBAdmission dataset
head(UCBAdmissions)

mosaicplot(UCBAdmissions, col = "rosybrown")

mosaicplot(UCBAdmissions, sort = 3:1,
           col = hcl(c(120, 10)),
           main = "Student admissions at UC Berkeley")

ft <- ftable(UCBAdmissions)
ft
hist(ft)
####    " ftable(), short for "flatten table," is a function in R that creates a flat contingency table.

hist(ft, col = "#f6f805")

install.packages("dplyr")
library(dplyr)

admissions <- as.data.frame(UCBAdmissions)
adm <- admissions %>% filter(Dept %in% c("A", "B", "C")) %>%  knitr::kable()
adm
#### The kable() function in knitr is a very simple table generator, and is simple by design. It only generates tables for strictly rectangular data such as matrices and data frames. You cannot heavily format the table cells or merge cells.

library(broom)
ucb_tidy <- tidy(UCBAdmissions)

ucb_tidy_aggregated <- ucb_tidy %>% 
  group_by(Admit, Gender) %>% 
  summarize(n = sum(n)) %>% 
  ungroup() %>% 
  group_by(Gender) %>% 
  mutate(prop = n/sum(n)) %>% 
  filter(Admit == "Admitted")

ucb_tidy_aggregated