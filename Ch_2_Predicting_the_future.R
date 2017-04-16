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



