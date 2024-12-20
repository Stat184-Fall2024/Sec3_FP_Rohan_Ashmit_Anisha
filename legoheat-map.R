legoData <- read.csv("~/Downloads/LEGO Data/sets.csv"
                     , header = TRUE
# Calculate average MSRP by Theme and Year
avg_
msrp_
theme
_year <- lego
_
data
_
clean %>%
group_
by(Theme, Year) %>%
summarize(avg_
msrp = mean(USD
_
MSRP, na.rm = TRUE)) %>%
ungroup()
# Create heatmap
ggplot(avg_
msrp_
theme
_year, aes(x = Year, y = Theme, fill = avg_
msrp)) +
geom
_
tile(color = "white") +
scale
_
fill
_gradient(low = "lightyellow"
, high = "red") +
labs(
title = "Heatmap of Average LEGO Set MSRP by Theme and Year"
,
x = "Year"
,
y = "Theme"
,
fill = "Avg MSRP (USD)"
) +
theme
_
minimal(base
_
size = 15) +
theme(
plot.title = element
_
text(hjust = 0.5, face = "bold"),
axis.text.y = element
_
text(size = 8)
)
# Calculate average MSRP by Theme and Year
avg_
msrp_
theme
_year <- lego
_
data
_
clean %>%
  group_
by(Theme, Year) %>%
  summarize(avg_
            msrp = mean(USD
                        _
                        MSRP, na.rm = TRUE)) %>%
  ungroup()
# Create heatmap
ggplot(avg_
       msrp_
       theme
       _year, aes(x = Year, y = Theme, fill = avg_
                  msrp)) +
  geom
_
tile(color = "white") +
  scale
_
fill
_gradient(low = "lightyellow"
          , high = "red") +
  labs(
    title = "Heatmap of Average LEGO Set MSRP by Theme and Year"
    ,
    x = "Year"
    ,
    y = "Theme"
    ,
    fill = "Avg MSRP (USD)"
  ) +
  theme
_
minimal(base
        _
        size = 15) +
  theme(
    plot.title = element
    _
    text(hjust = 0.5, face = "bold"),
    axis.text.y = element
    _
    text(size = 8)
  )