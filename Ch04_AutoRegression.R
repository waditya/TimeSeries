#Simulate the autoregressive model

#The autoregressive (AR) model is arguably the most widely used time series model. 
#It shares the very familiar interpretation of a simple linear regression, but here 
#each observation is regressed on the previous observation. The AR model also includes 
#the white noise (WN) and random walk (RW) models examined in earlier chapters as special cases.

#The versatile arima.sim() function used in previous chapters can also be used to simulate data from 
#an AR model by setting the model argument equal to list(ar = phi) , in which phi is a slope parameter 
#from the interval (-1, 1). We also need to specify a series length n.

#In this exercise, you will use this command to simulate and plot three different AR models 
#with slope parameters equal to 0.5, 0.9, and -0.75, respectively.

# Simulate an AR model with 0.5 slope
x <- arima.sim(model = list(ar = 0.5), n = 100)

# Simulate an AR model with 0.9 slope
y <- arima.sim(model = list(ar = 0.9) ,n = 100)

# Simulate an AR model with -0.75 slope
z <-  arima.sim(model = list(ar = -0.75), n= 100)

# Plot your simulated data
plot.ts(cbind(x, y, z))

#Estimate the autocorrelation function (ACF) for an autoregression

# What if you need to estimate the autocorrelation function from your data? To do so, you will need the acf() command, 
# which estimates autocorrelation by exploring lags in your data. By default, this command generates a plot of the relationship 
# between the current observation and lags extending backwards.

# In this exercise, you'll use the acf() command to estimate the autocorrelation function for three new simulated AR series (x, y, and z). 
# These objects have slope parameters 0.5, 0.9, and -0.75, respectively, and are shown in the adjoining figure.

# Calculate the ACF for x
acf(x)

# Calculate the ACF for y
acf(y)

# Calculate the ACF for z
acf(z)

#Compare the random walk (RW) and autoregressive (AR) models


# The random walk (RW) model is a special case of the autoregressive (AR) model, in which the slope parameter is equal to 1. 
# Recall from previous chapters that the RW model is not stationary and exhibits very strong persistence. 
# Its sample autocovariance function (ACF) also decays to zero very slowly, meaning past values have a long lasting impact on current values.

# The stationary AR model has a slope parameter between -1 and 1. The AR model exhibits higher persistence when its slope parameter
 # is closer to 1, but the process reverts to its mean fairly quickly. Its sample ACF also decays to zero at a quick (geometric) rate, 
 # indicating that values far in the past have little impact on future values of the process.

# In this exercise, you will explore these qualities by simulating and plotting additional data from an AR model.

# Simulate and plot AR model with slope 0.9 
x <- arima.sim(model = list(ar = 0.9), n = 200)
ts.plot(x)
acf(x)

# Simulate and plot AR model with slope 0.98
y <- arima.sim(model = list(ar = 0.98), n = 200)
ts.plot(y)
acf(y)

# Simulate and plot RW model
z <- arima.sim(model = list(order = c(0, 1, 0)), n = 200)
ts.plot(z)
acf(z)

