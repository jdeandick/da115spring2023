https://github.com/jdeandick/da115spring2023

Introduction: The COVID-19 pandemic has caused severe economic uncertainty in various industries, leading to significant job losses and business closures worldwide. In this analysis, I aim to answer the research question, "Which industries have gained the most in the aftermath of the financial upheavals caused by the pandemic?" This analysis will explore the shift in wealth and identify industries that have thrived despite the economic turmoil caused by the pandemic.

Data Selection and Cleaning: The initial dataset used in this analysis was taken from Kaggle, which provided data on the world's billionaires from 1987 to 2022. However, this dataset was limited, as it only pulled data from the top 10 per year. Thus, I moved to a more comprehensive dataset available on Kaggle, which provided information on global billionaire wealth and sources from 2002 to 2023. Due to the highly diverse listing under the industry column, I created a 'sector' column to group like companies. This process was time-consuming, but necessary for this analysis.

Methods and Results:

The first step in the analysis was to visualize the total income by sector and year. To accomplish this, I grouped the data by sector, year, and company, and summed the annual income to obtain the sector_income_year dataframe. Using ggplot2, I created a horizontal stacked bar chart, with the x-axis representing the total income in billions and the y-axis representing the sector. The fill represented the year, allowing me to see the proportion of the total income that each year contributed to the sector's total. The resulting chart provided a clear and concise overview of the total income by sector and year, enabling me to identify the sectors that have gained the most in the aftermath of the pandemic's financial upheavals.

Next, I calculated the total income for each sector before and after the pandemic. To achieve this, I grouped the sector_income_year dataframe by sector and year, and summed the total income to create the sector_income dataframe. I then filtered the data to obtain the pre-pandemic and post-pandemic dataframes, where pre-pandemic refers to data before 2020, and post-pandemic refers to data from 2020 onwards. I calculated the percentage of total income earned before and after the pandemic for each sector and merged the pre-pandemic and post-pandemic dataframes to create the pct_total_income dataframe.

| sector                           | percent_total_income_pre | percent_total_income_post | diff_percent_total_income |
|---------------------------------|--------------------------|---------------------------|---------------------------|
| Technology                      | 11.4                     | 17.4                      | 5.99                      |
| Healthcare and Pharmaceuticals | 3.52                     | 6.21                      | 2.69                      |
| Industrial Goods and Services  | 15.3                     | 16.8                      | 1.48                      |
| Agriculture and Food Production| 6.23                     | 6.84                      | 0.610                     |
| Construction and Real Estate   | 9.68                     | 8.21                      | -1.47                     |
| Consumer Goods and Services    | 17.1                     | 15.6                      | -1.48                     |
| Energy and Utilities           | 4.69                     | 3.16                      | -1.53                     |
| Diversified                    | 9.44                     | 7.56                      | -1.88                     |
| Media and Communications       | 8.42                     | 6.36                      | -2.06                     |
| Finance and Insurance          | 14.1                     | 11.8                      | -2.36                     |

The resulting table, shown above, indicates the percent of total income for each sector before and after the pandemic and the difference in percent total income between the two periods. The Technology and Healthcare and Pharmaceuticals sectors had the most significant gains in percent total income, with increases of 5.99% and 2.69%, respectively.

Alternative Methods Considered:

While we used a horizontal stacked bar chart to visualize the total income by sector and year, we also considered other options. One alternative was to use a heat map, which could provide a more precise visualization of the proportion of total income that each year contributed to the sector's total. However, we decided against using a heat map because it would not allow us to easily compare the total income of each sector.

Another option was to use a line graph to visualize the changes in the percent total income for each sector over time. However, we chose not to use a line graph because it would not provide an overview of the total income by sector, which was important to answer our research question.

Additional Analysis:

An additional analysis that could be carried out is to explore the relationship between the gains made by the Technology and Healthcare and Pharmaceuticals sectors and the pandemic's impact on society. This analysis could investigate the link between the pandemic and the increased demand for technology and healthcare services. Additionally, it would be beneficial to compare the changes in income of the billionaire class to those in the lower-income brackets to identify any disparities in the economic recovery.

Additional Data:

To extend this analysis, additional data on the global economy, unemployment rates, and the pandemic's impact on society would be useful. It would also be beneficial to have data on individual companies within each sector to analyze the factors contributing to their success or loss.

Conclusion:

In conclusion, my analysis identified the sectors that gained the most and lost the most in the aftermath of the pandemic's financial upheavals. The Technology and Healthcare and Pharmaceuticals sectors saw the most significant gains, while the Finance and Insurance and Media and Communications sectors experienced the most significant losses. These findings can help businesses and policymakers make informed decisions about investing in sectors that have thrived despite the pandemic's economic turmoil.

Sources:

Base dataset(too large for git): https://www.kaggle.com/datasets/salimwid/global-billionaire-wealth-and-sources-2002-2023?resource=download
