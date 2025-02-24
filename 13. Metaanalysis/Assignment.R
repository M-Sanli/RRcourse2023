
library(meta)
library(dplyr)

data <- readxl::read_xlsx("data\\metaanalysis_data.xlsx")

meta_boys <- metacont(n.e = N_boys,
                      mean.e = Mean_boys_play_female,
                      sd.e =SD_boys_play_female,
                      n.c = N_boys,
                      mean.c = Mean_boys_play_female,
                      sd.c = SD_boys_play_female
                      data = data,
                      comb.fixed = TRUE,
                      comb.random = TRUE)
meta_girls <- metacont(n.e = N_girls,
                       mean.e = Mean_girls_play_male,
                       sd.e = SD_girls_play_male,
                       n.c = N_girls,
                       mean.c = Mean_girls_play_female,
                       sd.c = SD_girls_play_female,
                       data = data)


meta_boys %>% forest(sortvar = TE)
meta_girls %>% forest(sortvar = TE)

meta_boys %>% funnel()

contour_levels <- c(0.90, 0.95, 0.99)
contour_colors <- c("darkblue", "blue", "lightblue")
funnel(meta_boys, contour = contour_levels, col.contour = contour_colors)
legend("topright", c("p < 0.10", "p < 0.05", "p < 0.01"), bty = "n", fill = contour_colors)

contour_levels <- c(0.90, 0.95, 0.99)
contour_colors <- c("darkblue", "blue", "lightblue")
funnel(meta_girls, contour = contour_levels, col.contour = contour_colors)
legend("topright", c("p < 0.10", "p < 0.05", "p < 0.01"), bty = "n", fill = contour_colors)

meta_boys %>% metareg(~ 'country')
meta_girls %>% metareg(~ 'country')