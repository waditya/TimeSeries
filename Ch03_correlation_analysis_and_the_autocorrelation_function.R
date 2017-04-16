# Ch03_correlation_analysis_and_the_autocorrelation_function.R

# Asset prices vs. asset returns

# The goal of investing is to make a profit. The revenue or loss from investing depends on the amount invested and changes in prices, 

# and high revenue relative to the size of an investment is of central interest. This is what financial asset returns measure, changes in price as a fraction of the initial price 

# over a given time horizon, for example, one business day.

# Let us again consider the eu_stocks dataset. This dataset reports index values, which we can regard as prices. The indices are not investable assets themselves, 

# but there are many investable financial assets that closely track major market indices, including mutual funds and exchange traded funds.

# Log returns, also called continuously compounded returns, are also commonly used in financial time series analysis. They are the log of gross returns, or equivalently, the changes 

# (or first differences) in the logarithm of prices.

# The change in appearance between daily prices and daily returns is typically substantial, while the difference between daily returns and log returns is usually small. 

# As you will see later, one advantage of using log returns is that calculating multi-period returns from individual periods is greatly simplified - you just add them together!

# In this exercise, you will further explore the eu_stocks dataset, including plotting prices, converting prices to (net) returns, and converting prices to log returns