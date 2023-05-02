

library(ggplot2)

# The visualization is useful for exploring the data because it presents a clear and concise overview of the total income by sector and year. The visualization also shows the trend in the total income of each sector over time. By grouping the data by sector, year, and company and summing the annual income, the visualization allows us to identify the sectors that have gained the most in the aftermath of the pandemic's financial upheavals.
# 
# Choosing a horizontal stacked bar chart seems appropriate because it enables a comparison of the total income across different sectors and years while also allowing us to visualize the proportion of the total income that each year contributed to the sector's total. By stacking the bars horizontally, we can compare the total income of different sectors easily. Also, the chart presents the data in a visually appealing and easy-to-understand way.
#Here you can see wealth from the pandemic era at a glance by looking at how much of the stacked bar is composed of pink shades.

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



# Group data by sector and year, and calculate total income for each sector
sector_income <- sector_income_year %>%
  group_by(sector, year) %>%
  summarise(total_sector_income = sum(total_income)) %>%
  ungroup()

# Calculate total income earned before and after the pandemic for each sector
pre_pandemic <- sector_income %>%
  filter(year < 2020) %>%
  group_by(sector) %>%
  summarise(total_income = sum(total_sector_income)) %>%
  mutate(percent_total_income = round(total_income/sum(total_income)*100, 2)) %>%
  ungroup()

post_pandemic <- sector_income %>%
  filter(year >= 2020) %>%
  group_by(sector) %>%
  summarise(total_income = sum(total_sector_income)) %>%
  mutate(percent_total_income = round(total_income/sum(total_income)*100, 2)) %>%
  ungroup()

# Merge the pre-pandemic and post-pandemic dataframes
pct_total_income <- pre_pandemic %>%
  left_join(post_pandemic, by = "sector", suffix = c("_pre", "_post")) %>%
  mutate(diff_percent_total_income = percent_total_income_post - percent_total_income_pre) %>%
  arrange(desc(diff_percent_total_income))

# Print the resulting table
pct_total_income %>%
  select(sector, percent_total_income_pre, percent_total_income_post, diff_percent_total_income)



# # A tibble: 10 × 4
# sector                          percent_total_income_pre percent_total_income_post diff_percent_total_income
# <chr>                                              <dbl>                     <dbl>                     <dbl>
#   1 Technology                                         11.4                      17.4                      5.99 
# 2 Healthcare and Pharmaceuticals                      3.52                      6.21                     2.69 
# 3 Industrial Goods and Services                      15.3                      16.8                      1.48 
# 4 Agriculture and Food Production                     6.23                      6.84                     0.610
# 5 Construction and Real Estate                        9.68                      8.21                    -1.47 
# 6 Consumer Goods and Services                        17.1                      15.6                     -1.48 
# 7 Energy and Utilities                                4.69                      3.16                    -1.53 
# 8 Diversified                                         9.44                      7.56                    -1.88 
# 9 Media and Communications                            8.42                      6.36                    -2.06 
# 10 Finance and Insurance                              14.1                      11.8                     -2.36 
# 
# 


















