library(ggplot2)
library(tidyr)
library(magrittr)
library(readr)

data <- read_delim("progress/progress.txt", " ", 
                   col_names = c("Chapter", "Goal", "Current"), skip = 1)

data$Chapter <- factor(data$Chapter, levels = rev(data$Chapter))
data %<>% gather(Goal, Wordcount, -Chapter)


ggsave("progress.png", 
       plot = ggplot(data, aes(x = Chapter, y = Wordcount, fill = Goal)) +
         geom_bar(stat = "identity", position = "dodge") +
         scale_fill_manual(values = c("darkgreen", "lightblue")) +
         coord_flip() +
         theme_minimal(),
       width = 10, height = 5, units = "cm")
