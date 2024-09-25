## code to prepare `AMECO_spring_2023` dataset

library(ecmacro)

AMECO_spring_2023 <- get_ecmacro("https://economy-finance.ec.europa.eu/document/download/adbcba6f-8169-4d6d-80e7-7a365ff6e87d_en?filename=ameco_spring2023.zip")

usethis::use_data(AMECO_spring_2023, overwrite = TRUE, compress = "xz")
