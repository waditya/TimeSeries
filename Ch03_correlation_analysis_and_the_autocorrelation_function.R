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

# Plot eu_stocks
plot(eu_stocks)

# Use this code to convert prices to returns
returns <- eu_stocks[-1,] / eu_stocks[-1860,] - 1

# Convert returns to ts
returns <- ts(returns, start = c(1991, 130), frequency = 260)

# Plot returns
plot(returns)

# Use this code to convert prices to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)

# Generate means from eu_percentreturns
colMeans(eu_percentreturns)

# Use apply to calculate sample variance from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = var)

# Use apply to calculate standard deviation from eu_percentreturns
apply(eu_percentreturns, MARGIN = 2, FUN = sd)

# Display a histogram of percent returns for each index
par(mfrow = c(2,2))
apply(eu_percentreturns, MARGIN = 2, FUN = hist, main = "", xlab = "Percentage Return")

# Display normal quantile plots of percent returns for each index
par(mfrow = c(2,2))
apply(eu_percentreturns, MARGIN = 2, FUN = qqnorm, main = "")
qqline(eu_percentreturns)

##Plotting pairs of data
# Time series data is often presented in a time series plot. For example, the index values from the eu_stocks dataset are shown in the adjoining figure. 
# Recall, eu_stocks contains daily closing prices from 1991-1998 for the major stock indices in Germany (DAX), Switzerland (SMI), France (CAC), and the UK (FTSE).

# It is also useful to examine the bivariate relationship between pairs of time series. In this exercise we will consider the contemporaneous relationship, 
# that is matching observations that occur at the same time, between pairs of index values as well as their log returns. 
# The plot(a, b) function will produce a scatterplot when two time series names a and b are given as input.

# To simultaneously make scatterplots for all pairs of several assets the pairs() function can be applied to produce a scatterplot matrix. 
# When shared time trends are present in prices or index values it is common to instead compare their returns or log returns.

# In this exercise, you'll practice these skills on the eu_stocks data. Because the DAX and FTSE returns have similar time coverage, you can 
# easily make a scatterplot of these indices. Note that the normal distribution has elliptical contours of equal probability, and pairs of data 
# drawn from the multivariate normal distribution form a roughly elliptically shaped point cloud. 
# Do any of the pairs in the scatterplot matrices exhibit this pattern, before or after log transformation?

# Make a scatterplot of DAX and FTSE
plot(DAX, FTSE)

# Make a scatterplot matrix of eu_stocks
pairs(eu_stocks)

# Convert eu_stocks to log returns
logreturns <- diff(log(eu_stocks))

# Plot logreturns
plot(logreturns)

# Make a scatterplot matrix of logreturns
pairs(logreturns)

#Calculating sample covariances and correlations

# Sample covariances measure the strength of the linear relationship between matched pairs of variables. 
# The cov() function can be used to calculate covariances for a pair of variables, or a covariance matrix
 # when a matrix containing several variables is given as input. For the latter case, the matrix is symmetric 
 # with covariances between variables on the off-diagonal and variances of the variables along the diagonal. 
 # On the right you can see the scatterplot matrix of your logreturns data.

# Covariances are very important throughout finance, but they are not scale free and they can be difficult to directly interpret. 
# Correlation is the standardized version of covariance that ranges in value from -1 to 1, where values close to 1 in magnitude 
# indicate a strong linear relationship between pairs of variables. The cor() function can be applied to both pairs of variables 
# as well as a matrix containing several variables, and the output is interpreted analogously.

# In this exercise, you'll use cov() and cor() to explore your logreturns data.

# Use cov() with DAX_logreturns and FTSE_logreturns
cov(DAX_logreturns, FTSE_logreturns)

# Use cov() with logreturns
cov(logreturns)

# Use cor() with DAX_logreturns and FTSE_logreturns
cor(DAX_logreturns, FTSE_logreturns)

# Use cor() with logreturns
cor(logreturns)

#Calculating autocorrelations

# Autocorrelations or lagged correlations are used to assess whether a time series is dependent on its past. 
# For a time series x of length n we consider the n-1 pairs of observations one time unit apart. 
# The first such pair is (x[2],x[1]), and the next is (x[3],x[2]). Each such pair is of the form (x[t],x[t-1]) where 
# t is the observation index, which we vary from 2 to n in this case. The lag-1 autocorrelation of x can be estimated 
# as the sample correlation of these (x[t], x[t-1]) pairs.

# In general, we can manually create these pairs of observations. First, create two vectors, x_t0 and x_t1, 
# each with length n-1, such that the rows correspond to (x[t], x[t-1]) pairs. Then apply the cor() function 
# to estimate the lag-1 autocorrelation.

# Luckily, the acf() command provides a shortcut. Applying acf(..., lag.max = 1, plot = FALSE) to a series x 
# automatically calculates the lag-1 autocorrelation.

# Finally, note that the two estimates differ slightly as they use slightly different scalings in 
# their calculation of sample covariance, 1/(n-1) versus 1/n. Although the latter would provide a biased estimate, 
# it is preferred in time series analysis, and the resulting autocorrelation estimates only differ by a factor of (n-1)/n.

# In this exercise, you will practice both the manual and automatic calculation of a lag-1 autocorrelation. 
# # The time series x and its length n (150) have already been loaded. The series is shown in the plot on the right.

# Define x_t0 as x[-1]
x_t0 <- x[-1] 

# Define x_t1 as x[-n]
x_t1 <- x[-n]

# Confirm that x_t0 and x_t1 are (x[t], x[t-1]) pairs  
head(cbind(x_t0, x_t1))
  
# Plot x_t0 and x_t1
plot(x_t0, x_t1)

# View the correlation between x_t0 and x_t1
cor(x_t0, x_t1)

# Use acf with x
acf(x, lag.max = 1, plot = FALSE)

# Confirm that difference factor is (n-1)/n 
cor(x_t1, x_t0) * (n-1)/n

#The autocorrelation function

# Autocorrelations can be estimated at many lags to better assess how a time series relates to its past. 
# We are typically most interested in how a series relates to its most recent past.

# The acf(..., lag.max = ..., plot = FALSE) function will estimate all autocorrelations from 0, 1, 2,..., up to the 
# value specified by the argument lag.max. In the previous exercise, you focused on the lag-1 autocorrelation by setting the lag.max argument to 1.

# In this exercise, you will explore some further applications of the acf() command. Once again, the time series 
# x has been preloaded for you and is shown in the plot on the right.

# Generate ACF estimates for x up to lag-10
acf(x, lag.max = 10, plot = FALSE)

# Type the ACF estimate at lag-10 
0.100

# Type the ACF estimate at lag-5
0.198
