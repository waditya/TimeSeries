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

