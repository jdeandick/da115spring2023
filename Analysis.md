Introduction: The COVID-19 pandemic caused severe economic uncertainty in various industries, leading to significant job losses and business closures worldwide. In this analysis, we aim to answer the research question, "Which industries have gained the most in the aftermath of the financial upheavals caused by the pandemic?" This analysis will explore the shift in wealth and identify industries that have thrived despite the economic turmoil caused by the pandemic.

Data Selection and Cleaning: The initial dataset used in this analysis was taken from Kaggle, which provided data on the world's billionaires from 1987 to 2022. However, this dataset was limited, as it only pulled data from the top 10 per year. Thus, we moved to a more comprehensive dataset available on Kaggle, which provided information on global billionaire wealth and sources from 2002 to 2023. Due to the highly diverse listing under the industry column, we created a 'sector' column to group like companies. This process was time-consuming, but necessary for this analysis.
Methods and Results:

The first step in the analysis was to visualize the total income by sector and year. To accomplish this, we grouped the data by sector, year, and company, and summed the annual income to obtain the sector_income_year dataframe. Using ggplot2, we created a horizontal stacked bar chart, with the x-axis representing the total income in billions and the y-axis representing the sector. The fill represented the year, allowing us to see the proportion of the total income that each year contributed to the sector's total. The resulting chart provided a clear and concise overview of the total income by sector and year, enabling us to identify the sectors that have gained the most in the aftermath of the pandemic's financial upheavals.

Next, we calculated the total income for each sector before and after the pandemic. To achieve this, we grouped the sector_income_year dataframe by sector and year, and summed the total income to create the sector_income dataframe. We then filtered the data to obtain the pre-pandemic and post-pandemic dataframes, where pre-pandemic refers to data before 2020, and post-pandemic refers to data from 2020 onwards. We calculated the percentage of total income earned before and after the pandemic for each sector and merged the pre-pandemic and post-pandemic dataframes to create the pct_total_income dataframe.

The resulting table, shown above, indicates the percent of total income for each sector before and after the pandemic and the difference in percent total income between the two periods. The Technology and Healthcare and Pharmaceuticals sectors had the most significant gains in percent total income, with increases of 5.99% and 2.69%, respectively. The Finance and Insurance and Media and Communications sectors had the most significant losses, with decreases of 2.36% and 2.06%, respectively.

Conclusion:

In conclusion, our analysis identified the sectors that gained the most and lost the most in the aftermath of the pandemic's financial upheavals. The Technology and Healthcare and Pharmaceuticals sectors saw the most significant gains, while the Finance and Insurance and Media and Communications sectors experienced the most significant losses. These findings can help businesses and policymakers make informed decisions about investing in sectors that have thrived despite the pandemic's economic turmoil.











