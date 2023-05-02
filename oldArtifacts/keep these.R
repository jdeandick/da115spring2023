library(dplyr)
total_income <- data %>% group_by(year, sector) %>% summarise(total_income = sum(annual_income))


library(ggplot2)
ggplot(total_income, aes(x = year, y = total_income, color = sector)) + 
  geom_point(aes(size = total_income)) +
  labs(x = "Year", y = "Total Income", title = "Wealth by Sector") +
  theme_minimal()

for (year in sort(unique(total_income$year))) {
  plot_data <- filter(total_income, year == year)
  plot <- ggplot(plot_data, aes(x = year, y = total_income, color = sector)) + 
    geom_point(aes(size = total_income)) +
    labs(x = "Year", y = "Total Income", title = paste("Wealth by Sector", year)) +
    theme_minimal()
  ggsave(paste("wealth_by_sector_", year, ".png", sep = ""), plot, width = 8, height = 6, dpi = 300)
}



#Wealth by Sector Scatter Plot
#needs better labels


library(ggplot2)

# Group the data by year and sector
grouped_data <- data %>%
  group_by(year, sector) %>%
  summarize(total_income = sum(annual_income))

# Loop through the years
for (y in sort(unique(grouped_data$year))) {
  
  # Subset the data for the current year
  subset_data <- grouped_data[grouped_data$year == y, ]
  
  # Create the scatterplot
  p <- ggplot(subset_data, aes(x = sector, y = total_income/1e9)) +
    geom_point(aes(size = total_income, color = sector)) +
    scale_size_continuous(range = c(2, 10)) +
    ggtitle(paste("Wealth by sector in", y)) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  # Save the plot to a file
  ggsave(paste("scatterplot_", y, ".png", sep = ""), p)
}




# The visualization is useful for exploring the data because it presents a clear and concise overview of the total income by sector and year. The visualization also shows the trend in the total income of each sector over time. By grouping the data by sector, year, and company and summing the annual income, the visualization allows us to identify the sectors that have gained the most in the aftermath of the pandemic's financial upheavals.
# 
# Choosing a horizontal stacked bar chart seems appropriate because it enables a comparison of the total income across different sectors and years while also allowing us to visualize the proportion of the total income that each year contributed to the sector's total. By stacking the bars horizontally, we can compare the total income of different sectors easily. Also, the chart presents the data in a visually appealing and easy-to-understand way.


# Group data by sector, year, and company, and sum annual income
sector_income_year <- data %>%
  group_by(sector, year, company) %>%
  summarise(total_income = sum(annual_income))

# Create horizontal stacked bar chart
ggplot(sector_income_year, aes(x = total_income/1e9, y = sector, fill = factor(year))) +
  geom_col() +
  scale_x_continuous(labels = scales::comma, name = "Total Income (in billions)") +
  labs(title = "Total Income by Sector and Year", subtitle = "Data from 2002-2022", y = "Sector") +
  theme_bw()


#Companies entering and leaving each sector separately to show which are growing and shrinking in terms of the number of companies:
#here we can see

# Count the number of companies in each sector and year
sector_company_count <- data %>%
  group_by(sector, year) %>%
  summarise(company_count = n_distinct(company))

# Create a line chart to show the change in company count over time for each sector
ggplot(sector_company_count, aes(x = year, y = company_count, color = sector)) +
  geom_line() +
  labs(title = "Change in Company Count by Sector", subtitle = "Data from 2002-2022", x = "Year", y = "Company Count") +
  theme_bw()





# Group data by sector and year, and sum annual income
sector_income_year <- data %>%
  group_by(sector, year) %>%
  summarise(total_income = sum(annual_income))

# Calculate the percentage change in income from the previous year for each sector
sector_income_year <- sector_income_year %>%
  mutate(percent_change = (total_income/lag(total_income) - 1) * 100)

# Create a line chart to show the percentage change in income over time for each sector
ggplot(sector_income_year, aes(x = year, y = percent_change, color = sector)) +
  geom_line() +
  scale_y_continuous(labels = scales::comma, name = "Percentage Change in Income") +
  labs(title = "Percentage Change in Income by Sector", subtitle = "Data from 2002-2022", x = "Year") +
  theme_bw()










# Get list of all sectors
all_sectors <- unique(data$sector)

sector_income_year_change <- sector_income_year %>%
  pivot_wider(names_from = year, values_from = total_income) %>%
  mutate(across(-1, ~ . - lag(., default = first(.)))) %>%
  pivot_longer(names_to = "year", values_to = "income_change", cols = -sector)


# Order sectors by median income change across all years
sector_order <- sector_income_year_change %>%
  group_by(sector) %>%
  summarize(median_change = median(income_change, na.rm = TRUE)) %>%
  arrange(desc(median_change)) %>%
  pull(sector)

# Add missing sector to sector_order
sector_order <- c(sector_order, setdiff(all_sectors, sector_order))

# Create heatmap with color-coded visuals
ggplot(sector_income_year_change, aes(x = year, y = factor(sector, levels = sector_order), fill = income_change)) +
  geom_tile(color = "white", size = 0.25) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0, name = "Income Change") +
  labs(title = "Income Change by Sector and Year", subtitle = "Data from 2002-2022", x = "Year", y = "Sector") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
