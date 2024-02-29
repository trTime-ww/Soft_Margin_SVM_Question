# Create Dataset for Soft-margin SVM

library(tibble)

tibble_3_blue <- tibble(x_1 = seq(0.1, 0.3, length.out = 3), 
                        x_2 = rep(-0.1, 3), 
                        y = rep(1, 3))

tibble_3_red <- tibble(-tibble_3_blue)

tibble_1_blue <- tibble(x_1 = -3, x_2 = 0, y = 1)

tibble_1_red <- tibble(-tibble_1_blue)

tibble_101_blue <- tibble(x_1 = seq(0, 1, length.out = 101), 
                          x_2 = rep(0.5, 101), 
                          y = rep(1, 101))

tibble_101_red <- tibble(-tibble_101_blue)

tibble_10000_blue <- tibble(x_1 = seq(1 + 0.1/10000, 1.1, length.out = 10000), 
                          x_2 = rep(0.5, 10000), 
                          y = rep(1, 10000))

tibble_10000_red <- tibble(-tibble_10000_blue)

tibble_19000_blue <- tibble(x_1 = seq(1.1 + 1.9/19000, 3, length.out = 19000), 
                            x_2 = rep(0.5, 19000), 
                            y = rep(1, 19000))

tibble_19000_red <- tibble(-tibble_19000_blue)


library(dplyr)
library(openxlsx)

# List all objects in the global environment
all_objects <- ls()

# Retrieve all objects
all_values <- mget(all_objects)

# Filter only tibbles or data frames
tibbles_list <- Filter(function(x) is_tibble(x) || is.data.frame(x), all_values)

# Combine all tibbles/data frames
combined_tibble <- bind_rows(tibbles_list)


write.xlsx(combined_tibble, "test_dataset.xlsx")

