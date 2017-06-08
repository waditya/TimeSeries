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

