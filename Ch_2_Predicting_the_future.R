#Predicting_the_future
# Log rapid_growth
linear_growth <- log(rapid_growth)
  
# Plot linear_growth using ts.plot()
 ts.plot(linear_growth)

# Generate the first difference of z
dz <- diff(z)
  
# Plot dz

ts.plot(dz)

# View the length of z and dz, respectively
length(z)
length(dz)

# Generate a diff of x with lag = 4. Save this to dx
dx <- diff(x, lag = 4)
  
# Plot dx
ts.plot(dx)

# View the length of x and dx, respectively 
length(x)
length(dx)

##Great work! Once again differencing allows you to remove the longer-term time trend - in this case, seasonal volatility - and 
##focus on the change from one period to another.

# The white noise (WN) model is a basic time series model. It is also a basis for the more elaborate models we will consider. 

# We will focus on the simplest form of WN, independent and identically distributed data.

# The arima.sim() function can be used to simulate data from a variety of time series models. 

# ARIMA is an abbreviation for the autoregressive integrated moving average class of models we will consider throughout this course.

# An ARIMA(p, d, q) model has three parts, the autoregressive order p, the order of integration (or differencing) d, and the 

# moving average order q. We will detail each of these parts soon, but for now we note that the ARIMA(0, 0, 0) model, 

# i.e., with all of these components zero, is simply the WN model.

# In this exercise, you will practice simulating a basic WN model.

# Simulate a WN model with list(order = c(0, 0, 0))
white_noise <- arima.sim(model = list(order = c(0, 0, 0)), n = 100)

# Plot your white_noise data
ts.plot(white_noise)

# Simulate from the WN model with: mean = 100, sd = 10
white_noise_2 <- arima.sim(model = list(order = c(0, 0, 0)), n = 100, mean = 100, sd = 10)

# Plot your white_noise_2 data
ts.plot(white_noise_2)

# Estimate the white noise model

# For a given time series y we can fit the white noise (WN) model using the arima(..., order = c(0, 0, 0)) function. 

# Recall that the WN model is an ARIMA(0,0,0) model. Applying the arima() function returns information or output about the estimated model. 

# For the WN model this includes the estimated mean, labeled intercept, and the estimated variance, labeled sigma^2.

# In this exercise, you'll explore the qualities of the WN model. What is the estimated mean? Compare this with the sample mean using the mean() function. 

# What is the estimated variance? Compare this with the sample variance using the var() function.

# The time series y has already been loaded, and is shown in the adjoining figure.

# Fit the WN model to y using the arima command
arima(y, order = c (0, 0, 0))

# Calculate the sample mean and sample variance of y
mean(y)
var(y)

Simulate the random walk model

# The random walk (RW) model is also a basic time series model. It is the cumulative sum (or integration) of a mean zero white noise (WN) series, 

# such that the first difference series of a RW is a WN series. 

# Note for reference that the RW model is an ARIMA(0, 1, 0) model, in which the middle entry of 1 indicates that the model's order of integration is 1.

# The arima.sim() function can be used to simulate data from the RW by including the model = list(order = c(0, 1, 0)) argument. We also need to specify a 

# series length n. Finally, you can specify a sd for the series (increments), where the default value is 1.

# Generate a RW model using arima.sim
random_walk <- arima.sim(model = list(order = c(0, 1, 0)), n = 100)

# Plot random_walk
ts.plot(random_walk)

# Calculate the first difference series
random_walk_diff <- diff(random_walk) 

# Plot random_walk_diff
ts.plot(random_walk_diff)
  
# Simulate the random walk model with a drift

# A random walk (RW) need not wander about zero, it can have an upward or downward trajectory, i.e., 

# a drift or time trend. This is done by including an intercept in the RW model, which corresponds to the slope of the RW time trend.

# For an alternative formulation, you can take the cumulative sum of a constant mean white noise (WN) series, 

# such that the mean corresponds to the slope of the RW time trend.

# To simulate data from the RW model with a drift you again use the arima.sim() function with 

# the model = list(order = c(0, 1, 0)) argument. This time, you should add 

# the additional argument mean = ... to specify the drift variable, or the intercept.

# Generate a RW model with a drift uing arima.sim
rw_drift <- arima.sim(model = list(order = c(0, 1, 0)), n = 100, mean = 1)

# Plot rw_drift
ts.plot(rw_drift)

# Calculate the first difference series
rw_drift_diff <- diff(rw_drift)

# Plot rw_drift_diff
ts.plot(rw_drift_diff)

# Estimate the random walk model

# For a given time series y we can fit the random walk model with a drift by first differencing the data, 

# then fitting the white noise (WN) model to the differenced data using the arima() command with the order = c(0, 0, 0)) argument.

# The arima() command displays information or output about the fitted model. 

# Under the Coefficients: heading is the estimated drift variable, named the intercept. 

# Its approximate standard error (or s.e.) is provided directly below it. 

# The variance of the WN part of the model is also estimated under the label sigma^2.

# Difference your random_walk data
rw_diff <- diff(random_walk)

# Plot rw_diff
ts.plot(rw_diff)

# Now fit the WN model to the differenced data
model_wn <- arima(rw_diff, order = c(0,0,0))

# Store the value of the estimated time trend (intercept)
int_wn <- model_wn$coef

# Plot the original random_walk data
ts.plot(random_walk)

# Use abline(0, ...) to add time trend to the figure
abline(a= NULL, b = int_wn)



