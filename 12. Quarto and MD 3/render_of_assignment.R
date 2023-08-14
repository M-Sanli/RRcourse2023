install.packages("quarto")
library(quarto)

setwd("C:/Users/Mustafa/Desktop/DSBA/3. Yıl 2. Dönem/Reproducible Research/RETAKE/RRcourse2023/12. Quarto and MD 3")


for (season in 1:8) {
  quarto_render(
    "Assignment.qmd",
    output_file = paste0("Season_", season, "_Report.html"),
    execute_params = list(season = season))
}