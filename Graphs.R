library(ggplot2)
library(readr)
library(dplyr)

pumpkins <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-10-19/pumpkins.csv') |>
  mutate(weight_lbs = as.numeric(weight_lbs), ott = as.numeric(ott),
         est_weight = as.numeric(est_weight), pct_chart = as.numeric(pct_chart)) %>%
  filter(state_prov == "North Carolina")

ggplot(pumpkins) +
  geom_point(aes(x = ott, 
                 y = est_weight)) +
             #size = 3, alpha = 0.5) 
  labs(x = "Over the top inches", y = "Estimated weight (in pounds)", title = "Pumpkin Size vs Estimated Weight in NC") +
  scale_y_continuous(breaks = seq(0, 1000, 100), expand = expansion(mult = 0.05, add = 0)) +
  scale_x_continuous(breaks = seq(0, 350, 50), limits = c(0, 350), expand = expansion(mult = 0, add = 20)) +
  theme(plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white"),
        #panel.grid = element_line(color = "white"),
        plot.title = element_text(color = "orange", 
                                  size = 16, 
                                  face = "bold", 
                                  #family = "Courier",
                                  hjust = 0.5),
        axis.title = element_text(color = "darkorange", 
                                  size = 14),
        axis.text = element_text(color = "black"),
        axis.ticks = element_line(color = "black"),
        #legend.background = element_rect(fill = "darkgray"),
        plot.margin = margin(10, 10, 10, 10))
