
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

