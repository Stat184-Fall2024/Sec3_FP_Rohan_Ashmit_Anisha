# Load necessary packages
packages <- c("tidyverse", "ggplot2", "dplyr", "gt")
lapply(packages, library, character.only = TRUE)

# Set CRAN repository
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Load the dataset
legoData <- read.csv("~/Downloads/LEGO Data/sets.csv", header = TRUE, stringsAsFactors = FALSE)

# Inspect the structure of the data
str(legoData)

# Display summary statistics
summary(legoData)

# View the first few rows
head(legoData)

# Check for missing values
total_na <- sum(is.na(legoData))
cat("Missing values in the dataset:", total_na, "\n")

# Remove rows with any NA values
lego_data_clean <- legoData %>%
  drop_na()

# Remove duplicate rows
lego_data_clean <- lego_data_clean %>%
  distinct()

# Create a new column: price per piece
lego_data_clean <- lego_data_clean %>%
  mutate(price_per_piece = ifelse(Pieces > 0, Current_Price / Pieces, NA))

# Remove sets with zero pieces for accurate analysis
lego_data_clean <- lego_data_clean %>%
  filter(Pieces > 0)

# Verify the cleaned data
str(lego_data_clean)
summary(lego_data_clean)

# Remove duplicate rows from original dataset
legoData <- legoData[!duplicated(legoData), ]

# Add column for MSRP per piece
legoData <- legoData %>%
  mutate(msrp_per_piece = ifelse(Pieces > 0, USD_MSRP / Pieces, NA))

# Calculate summary statistics
stats_summary <- legoData %>%
  summarize(
    min_usd_msrp = min(USD_MSRP, na.rm = TRUE),
    max_usd_msrp = max(USD_MSRP, na.rm = TRUE),
    mean_usd_msrp = mean(USD_MSRP, na.rm = TRUE),
    median_usd_msrp = median(USD_MSRP, na.rm = TRUE),
    sd_usd_msrp = sd(USD_MSRP, na.rm = TRUE),
    min_pieces = min(Pieces, na.rm = TRUE),
    max_pieces = max(Pieces, na.rm = TRUE),
    mean_pieces = mean(Pieces, na.rm = TRUE),
    median_pieces = median(Pieces, na.rm = TRUE),
    sd_pieces = sd(Pieces, na.rm = TRUE),
    min_msrp_per_piece = min(msrp_per_piece, na.rm = TRUE),
    max_msrp_per_piece = max(msrp_per_piece, na.rm = TRUE),
    mean_msrp_per_piece = mean(msrp_per_piece, na.rm = TRUE),
    median_msrp_per_piece = median(msrp_per_piece, na.rm = TRUE),
    sd_msrp_per_piece = sd(msrp_per_piece, na.rm = TRUE),
    min_rating = min(Rating, na.rm = TRUE),
    max_rating = max(Rating, na.rm = TRUE),
    mean_rating = mean(Rating, na.rm = TRUE),
    median_rating = median(Rating, na.rm = TRUE),
    sd_rating = sd(Rating, na.rm = TRUE)
  )

# Display the summary table using gt
stats_summary %>%
  gt() %>%
  tab_header(
    title = "Descriptive Statistics of LEGO Set Prices, Piece Counts, and Ratings"
  ) %>%
  fmt_number(
    columns = everything(),
    decimals = 2
  ) %>%
  cols_label(
    min_usd_msrp = "Min MSRP (USD)",
    max_usd_msrp = "Max MSRP (USD)",
    mean_usd_msrp = "Mean MSRP (USD)",
    median_usd_msrp = "Median MSRP (USD)",
    sd_usd_msrp = "SD MSRP (USD)",
    min_pieces = "Min Pieces",
    max_pieces = "Max Pieces",
    mean_pieces = "Mean Pieces",
    median_pieces = "Median Pieces",
    sd_pieces = "SD Pieces",
    min_msrp_per_piece = "Min Price/Piece (USD)",
    max_msrp_per_piece = "Max Price/Piece (USD)",
    mean_msrp_per_piece = "Mean Price/Piece (USD)",
    median_msrp_per_piece = "Median Price/Piece (USD)",
    sd_msrp_per_piece = "SD Price/Piece (USD)",
    min_rating = "Min Rating",
    max_rating = "Max Rating",
    mean_rating = "Mean Rating",
    median_rating = "Median Rating",
    sd_rating = "SD Rating"
  )
