#Chapter_3_ARIMA_Models

# ARIMA - Plug and Play

# As you saw in the video, a time series is called ARIMA(p,d,qp,d,q) if the differenced series (of order dd) is ARMA(p,qp,q).

# To get a sense of how the model works, you will analyze simulated data from the integrated model
# Yt=.9Yt−1+Wt
# Yt=.9Yt−1+Wt
# where Yt=∇Xt=Xt−Xt−1Yt=∇Xt=Xt−Xt−1. In this case, the model is an ARIMA(1,1,0) because the differenced data are an autoregression of order one.

# The simulated time series is in x and it was generated in R as
# x <- arima.sim(model = list(order = c(1, 1, 0), ar = .9), n = 200).

# You will plot the generated data and the sample ACF and PACF of the generated data to see how integrated data behave. Then, you will difference the data to make it stationary. You will plot the differenced data and the corresponding sample ACF and PACF to see how differencing makes a difference.

# As before, the astsa package is preloaded in your workspace. Data from an ARIMA(1,1,0) with AR parameter .9 is saved in object x.

# Instructions
# Plot the generated data.
# Use acf2() from astsa to plot the sample P/ACF pair for the generated data.
# Plot the differenced data.
# Use another call to acf2() to view the sample P/ACF pair for the differenced data. Note how they imply an AR(1) model for the differenced data.

# Plot x
plot(x)

# Plot the P/ACF pair of x
acf2(x)

# Plot the differenced data
plot(diff(x))

# Plot the P/ACF pair of the differenced data
acf2(diff(x))

# Simulated ARIMA
# 100xp
# Before analyzing actual time series data, you should try working with a slightly more complicated model.

# Here, we generated 250 observations from the ARIMA(2,1,0) model with drift given by
# Yt=1+1.5Yt−1−.75Yt−2+Wt
# Yt=1+1.5Yt−1−.75Yt−2+Wt
# where Yt=∇Xt=Xt−Xt−1Yt=∇Xt=Xt−Xt−1.

# You will use the established techniques to fit a model to the data.

# The astsa package is preloaded and the generated data are in x. The series x and the detrended series y <- diff(x) have been plotted.

# Instructions
# Plot the sample ACF and PACF using acf2() of the differenced data diff(x) to determine a model.
# Fit an ARIMA(2,1,0) model using sarima() to the generated data. Examine the t-table and other output information 
# to assess the model fit.

# Plot sample P/ACF of differenced data and determine model
acf2(y)


# Estimate parameters and examine output
sarima(x, 2, 1, 0)

#Excellent! As you can see from your t-table, the estimated parameters are very close to 1.5 and -0.75.

# Global Warming
# 100xp
# Now that you have some experience fitting an ARIMA model to simulated data, your next task is to apply your skills to some real world data.

# The data in globtemp (from astsa) are the annual global temperature deviations to 2015. In this exercise, you will use established techniques to fit an ARIMA model to the data. A plot of the data shows random walk behavior, which suggests you should work with the differenced data. The differenced data diff(globtemp) are also plotted.

# After plotting the sample ACF and PACF of the differenced data diff(globtemp), you can say that either

# The ACF and the PACF are both tailing off, implying an ARIMA(1,1,1) model.
# The ACF cuts off at lag 2, and the PACF is tailing off, implying an ARIMA(0,1,2) model.
# The ACF is tailing off and the PACF cuts off at lag 3, implying an ARIMA(3,1,0) model. Although this model fits reasonably well, it is the worst of the three (you can check it) because it uses too many parameters for such small autocorrelations.
# After fitting the first two models, check the AIC and BIC to choose the preferred model.
# Instructions
# Plot the sample ACF and PACF of the differenced data, diff(globtemp), to discover that 2 models seem reasonable, an ARIMA(1,1,1) and an ARIMA(0,1,2).
# Use sarima() to fit an ARIMA(1,1,1) model to globtemp. Are all the parameters significant?
# Use another call to sarima() to fit an ARIMA(0,1,2) model to globtemp. Are all the parameters significant? Which model is better?

