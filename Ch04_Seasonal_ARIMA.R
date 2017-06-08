# Fit a Mixed Seasonal Model

# Pure seasonal dependence such as that explored earlier in this chapter is relatively rare. Most seasonal time series have mixed dependence, meaning only some of the variation is explained by seasonal trends.

# Recall that the full seasonal model is denoted by SARIMA(p,d,q)x(P,D,Q)S where capital letters denote the seasonal orders.

# As before, this exercise asks you to compare the sample P/ACF pair to the true values for some simulated seasonal data and fit a model to the data using sarima(). This time, the simulated data come from a mixed seasonal model, SARIMA(0,0,1)x(0,0,1)12. The plots on the right show three years of data, as well as the model ACF and PACF. Notice that, as opposed to the pure seasonal model, there are correlations at the nonseasonal lags as well as the seasonal lags.

# As always, the astsa package is preloaded. The generated data are in x.

# Instructions
# Plot the sample ACF and PACF of the generated data to lag 60 (max.lag = 60) and compare them to the actual values.
# Fit the model to generated data (x) using sarima(). As in the previous exercise, be sure to specify the additional seasonal arguments in your sarima() command.

# Plot sample P/ACF pair to lag 60 and compare to actual
acf2(x, max.lag = 60)

# Fit the seasonal model to x
sarima(x, p = 0, d = 0, q = 1, P = 0 , D = 0, Q = 1, S = 12 )

# Data Analysis - Unemployment I
# 100xp
# In the video, we fit a seasonal ARIMA model to the log of the monthly AirPassengers data set. You will now start to fit a seasonal ARIMA model to the monthly US unemployment data, unemp, from the astsa package.

# The first thing to do is to plot the data, notice the trend and the seasonal persistence. Then look at the detrended data and remove the seasonal persistence. After that, the fully differenced data should look stationary.

# The astsa package is preloaded in your workspace.

# Instructions
# Plot the monthly US unemployment (unemp) time series from astsa. Note trend and seasonality.
# Detrend and plot the data. Save this as d_unemp. Notice the seasonal persistence.
# Seasonally difference the detrended series and save this as dd_unemp. Plot this new data and notice that it looks stationary now.

# Plot unemp 
plot(unemp)

# Difference your data and plot it
d_unemp <- diff(unemp)
plot(d_unemp)

# Seasonally difference d_unemp and plot it
dd_unemp <- diff(d_unemp, lag = 12)  

plot(dd_unemp)

# Now that you have removed the trend and seasonal variation in unemployment, the data appear to be stationary.

# Data Analysis - Unemployment II

# Now, you will continue fitting an SARIMA model to the monthly US unemployment unemp time series by looking at the sample ACF and PACF of the fully differenced series.

# Note that the lag axis in the sample P/ACF plot is in terms of years. Thus, lags 1, 2, 3, ... represent 1 year (12 months), 2 years (24 months), 3 years (36 months), ...

# Once again, the astsa package is preloaded in your workspace.

# Instructions
# Difference the data fully (as in the previous exercise) and plot the sample ACF and PACF of the transformed data to lag 60 months (5 years). Consider that, for
# the nonseaonal component: the PACF cuts off at lag 2 and the ACF tails off.
# the seasonal component: the ACF cuts off at lag 12 and the PACF tails off at lags 12, 24, 36, ...
# Suggest and fit a model using sarima(). Check the residuals to ensure appropriate model fit.
# Hint
# To fit an appropriate model, use sarima(unemp, p = 2, d = 1, q = 0, P = 0, D = 1, Q = 1, S = 12) or simply sarima(unemp, 2, 1, 0, 0, 1, 1, 12) for short.

# Plot P/ACF pair of the fully differenced data to lag 60
dd_unemp <- diff(diff(unemp), lag = 12)
acf2(dd_unemp, max.lag = 60)

# Fit an appropriate model
sarima(unemp, p = 2, d = 1, q = 0, P = 0, D = 1, Q = 1, S = 12)

# , keep a close eye on the output from your sarima() command to get a feel for the fit of your model.

# Data Analysis - Commodity Prices

# Making money in commodities is not easy. Most commodities traders lose money rather than make it. The package astsa includes the data set chicken, which is the monthly whole bird spot price, Georgia docks, US cents per pound, from August, 2001 to July, 2016.

# The astsa package is preloaded in your R console and the data are plotted for you, note the trend and seasonal components.

# First, you will use your skills to carefully fit an SARIMA model to the commodity. Later, you will use the fitted model to try and forecast the whole bird spot price.

# After removing the trend, the sample ACF and PACF suggest an AR(2) model because the PACF cuts off after lag 2 and the ACF tails off. However, the ACF has a small seasonal component remaining. This can be taken care of by fitting an addition SAR(1) component.

# By the way, if you are interested in analyzing other commodities from various regions, you can find many different time series at index mundi.

# Instructions
# Plot the differenced (d = 1) data diff(chicken). Note that the trend is removed and note the seasonal behavior.
# Plot the sample ACF and PACF of the differenced data to lag 60 (5 years). Notice that an AR(2) seems appropriate but there is a small but significant seasonal component remaining in the detrended data.
# Fit an ARIMA(2,1,0) to the chicken data to see that there is correlation remaining in the residuals.
# Fit an SARIMA(2,1,0)x(1,0,0)12 and notice the model fits well.

