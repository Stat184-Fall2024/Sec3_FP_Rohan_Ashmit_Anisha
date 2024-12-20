Load the dataset
legoData <- read.csv("~/Downloads/LEGO Data/sets.csv", header = TRUE, stringsAsFactors = FALSE)

# Install and load ggcorrplot if not already installed
if (!requireNamespace("ggcorrplot", quietly = TRUE)) {
  install.packages("ggcorrplot")
}
library(ggcorrplot)

# Select relevant numeric columns
numeric_cols <- lego_data_clean %>%
  select(USD_MSRP, Pieces, msrp_per_piece, Rating, Minifigures, Total_Quantity)

# Compute correlation matrix
cor_matrix <- cor(numeric_cols, use = "complete.obs")

# Visualize correlation matrix
ggcorrplot(
  cor_matrix,
  method = "circle",
  type = "lower",
  lab = TRUE,
  lab_size = 3,
  colors = c("red", "white", "blue"),
  title = "Correlation Matrix of LEGO Set Variables",
  ggtheme = theme_minimal(base_size = 15)
)

# Calculate average MSRP by Theme and Year
avg_msrp_theme_year <- lego_data_clean %>%
  group_by(Theme, Year) %>%
  summarize(avg_msrp = mean(USD_MSRP, na.rm = TRUE)) %>%
  ungroup()

# Create heatmap of average MSRP by Theme and Year
ggplot(avg_msrp_theme_year, aes(x = Year, y = Theme, fill = avg_msrp)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightyellow", high = "red") +
  labs(
    title = "Heatmap of Average LEGO Set MSRP by Theme and Year",
    x = "Year",
    y = "Theme",
    fill = "Avg MSRP (USD)"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.y = element_text(size = 8)
  )
