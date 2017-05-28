
# II Fitting ARMA models

Fitting an AR(1) Model

# In this exercise, you will generate data from the AR(1) model,
# Xt=.9Xt−1+Wt,
# Xt=.9Xt−1+Wt,
# look at the simulated data and the sample ACF and PACF pair to determine the order. 
#Then, you will fit the model and compare the estimated parameters to the true parameters.

# Throughout this course, you will be using sarima() from the astsa package to easily fit models to data. 
#The command produces a residual diagnostic graphic that can be ignored until diagnostics is discussed later in the chapter.

# Instructions

# The package astsa is preloaded.
# Use the prewritten arima.sim() command to generate 100 observations from an AR(1) model with AR parameter .9. Save this to x.
# Plot the generated data using plot().
# Plot the sample ACF and PACF pairs using the acf2() command from the astsa package.

# Use sarima() from astsa to fit an AR(1) to the previously generated data. Examine the t-table and compare the estimates to the true values. 

# For example, if the time series is in x, to fit an AR(1) to the data, use sarima(x, p = 1, d = 0, q = 0) or simply sarima(x, 1, 0, 0).

# Generate 100 observations from the AR(1) model
x <- arima.sim(model = list(order = c(1, 0, 0), ar = .9), n = 100) 

# Plot the generated data 
plot(x)

# Plot the sample P/ACF pair
acf2(x)

# Fit an AR(1) to the data and examine the t-table

sarima(x, p = 1 , d = 0 , q = 0)

# Fitting an AR(2) Model

# For this exercise, we generated data from the AR(2) model,
# Xt=1.5Xt−1−.75Xt−2+Wt,
# Xt=1.5Xt−1−.75Xt−2+Wt,
# using x <- arima.sim(model = list(order = c(2, 0, 0), ar = c(1.5, -.75)), n = 200). 

# Look at the simulated data and the sample ACF and PACF pair to determine the model order. 

# Then fit the model and compare the estimated parameters to the true parameters.

# Instructions

# The package astsa is preloaded. x contains the 200 AR(2) observations.

# Use plot() to plot the generated data in x.

# Plot the sample ACF and PACF pair using acf2() from the astsa package.

# Use sarima() to fit an AR(2) to the previously generated data in x. Examine the t-table and compare the estimates to the true values.

# astsa is preloaded

# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an AR(2) to the data and examine the t-table
sarima(x,p=2, d= 0 , q = 0)

# In this exercise, we generated data from an MA(1) model,
# Xt=Wt−.8Wt−1,
# Xt=Wt−.8Wt−1,
# x <- arima.sim(model = list(order = c(0, 0, 1), ma = -.8), n = 100). 

#Look at the simulated data and the sample ACF and PACF to determine the order based on the table given in the first exercise. Then fit the model.

# Recall that for pure MA(q) models, the theoretical ACF will cut off at lag q while the PACF will tail off.

# Instructions

# The package astsa is preloaded. 100 MA(1) observations are available in your workspace as x.

# Use plot() to plot the generated data in x.

# Plot the sample ACF and PACF pairs using acf2() from the astsa package.

# # Use sarima() from astsa to fit an MA(1) to the previously generated data. Examine the t-table and compare the estimates to the true values

# astsa is preloaded

# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an MA(1) to the data and examine the t-table
sarima(x,0,0,1)

# Fitting an ARMA model
# 100xp
# You are now ready to merge the AR model and the MA model into the ARMA model. We generated data from the ARMA(2,1) model,
# Xt=Xt−1−.9Xt−2+Wt+.8Wt−1,
# Xt=Xt−1−.9Xt−2+Wt+.8Wt−1,
# x <- arima.sim(model = list(order = c(2, 0, 1), ar = c(1, -.9), ma = .8), n = 250). Look at the simulated data and the sample ACF and PACF pair to determine a possible model.

# Recall that for ARMA(p,qp,q) models, both the theoretical ACF and PACF tail off. In this case, the orders are difficult to discern from data and it may not be clear if either the sample ACF or sample PACF is cutting off or tailing off. In this case, you know the actual model orders, so fit an ARMA(2,1) to the generated data. General modeling strategies will be discussed further in the course.

# Instructions
# The package astsa is preloaded. 250 ARMA(2,1) observations are in x.
# As in the previous exercises, use plot() to plot the generated data in x and use acf2() to view the sample ACF and PACF pairs.
# Use sarima() to fit an ARMA(2,1) to the generated data. Examine the t-table and compare the estimates to the true values.

# astsa is preloaded

# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an ARMA(2,1) to the data and examine the t-table
sarima(x,2,0,1)

# Model Choice - I
# 100xp
# Based on the sample P/ACF pair of the logged and differenced varve data (dl_varve), an MA(1) was indicated. 
#The best approach to fitting ARMA is to start with a low order model, and then try to add a parameter at a time to see if the results change.

# In this exercise, you will fit various models to the dl_varve data and note the AIC and BIC for each model. In the next exercise, you will use these AICs and BICs to choose a model. 
#Remember that you want to retain the model with the smallest AIC and/or BIC value.

# A note before you start:

# sarima(x, p = 0, d = 0, q = 1) and sarima(x, 0, 0, 1)

# are the same.

# Instructions
# The package astsa is preloaded. The varve series has been logged and differenced as dl_varve <- diff(log(varve)).
# Use sarima() to fit an MA(1) to dl_varve. Take a close look at the output of your sarima() command to see the AIC and BIC for this model.
# Repeat the previous exercise, but add an MA parameter by fitting an MA(2) model. Based on AIC and BIC, is this an improvement over the previous model?
# Instead of adding an MA parameter, add an AR parameter to the original MA(1) fit. That is, fit an ARMA(1,1) to dl_varve. Based on AIC and BIC, is this an 
#improvement over the previous models?

# Fit an MA(1) to dl_varve.   
sarima(dl_varve, 0 ,0, 1)

# Fit an MA(2) to dl_varve. Improvement?
sarima(dl_varve, 0 ,0, 2)

# Fit an ARMA(1,1) to dl_varve. Improvement?
sarima(dl_varve, 1 ,0, 1)

# Residual Analysis - I
# 100xp
# As you saw in the video, an sarima() run includes a residual analysis graphic. Specifically, the output shows (1) the standardized residuals, (2) the sample ACF of the residuals, (3) a normal Q-Q plot, and (4) the p-values corresponding to the Box-Ljung-Pierce Q-statistic.

# In each run, check the four residual plots as follows:

# The standardized residuals should behave as a white noise sequence with mean zero and variance one. Examime the residual plot for departures from this behavior.
# The sample ACF of the residuals should look like that of white noise. Examine the ACF for departures from this behavior.
# Normality is an essential assumption when fitting ARMA models. Examine the Q-Q plot for departures from normality and to identify outliers.
# Use the Q-statistic plot to help test for departures from whiteness of the residuals.
# As in the previous exercise, dl_varve <- diff(log(varve)), which is plotted below a plot of varve. The astsa package is preloaded.

# Instructions
# Use sarima() to fit an MA(1) to dl_varve and do a complete residual analysis as prescribed above. Make a note of what you see for the next exercise.
# Use another call to sarima() to fit an ARMA(1,1) to dl_varve and do a complete residual analysis as prescribed above. Again, make a note of what you see for the next exercise.

# ARMA get in

# By now you have gained considerable experience fitting ARMA models to data, but before you start celebrating, try one more exercise (sort of) on your own.

# The data in oil are crude oil, WTI spot price FOB (in dollars per barrel), weekly data from 2000 to 2008. Use your skills to fit an ARMA model to the returns. The weekly crude oil prices (oil) are plotted for you. Throughout the exercise, work with the returns, which you will calculate.

# As before, the astsa package is preloaded for you. The data are preloaded as oil and plotted on the right.

# Instructions

# Calculate the approximate crude oil price returns using diff() and log(). Put the returns in oil_returns.

# Plot oil_returns and notice that there are a couple of outliers prior to 2004. Convince yourself that the returns are stationary.

# Plot the sample ACF and PACF of the oil_returns using acf2() from the astsa package.

# From the P/ACF pair, it is apparent that the correlations are small and the returns are nearly noise. 
# But it could be that both the ACF and PACF are tailing off. If this is the case, then an ARMA(1,1) is suggested. 

# Fit this model to the oil returns using sarima(). Does the model fit well? Can you see the outliers in the residual plot?

# Calculate approximate oil returns
oil_returns <- diff(log(oil))

# Plot oil_returns. Notice the outliers.
plot(oil_returns)

# Plot the P/ACF pair for oil_returns
acf2(oil_returns)

# Assuming both P/ACF are tailing, fit a model to oil_returns
sarima(oil_returns, 1, 0, 1)
