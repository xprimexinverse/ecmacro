## code to prepare `AMECO_spring_2024` dataset

library(ecmacro)

AMECO_spring_2024 <- get_ecmacro()

usethis::use_data(AMECO_spring_2024, overwrite = TRUE)
