# The simple moving average (MA) model is a parsimonious time series model used to account for very short-run autocorrelation. 
# It does have a regression like form, but here each observation is regressed on the previous innovation, which is not actually observed. 
# Like the autoregressive (AR) model, the MA model includes the white noise (WN) model as special case.

# As with previous models, the MA model can be simulated using the arima.sim() command by setting the model argument to list(ma = theta), 
# where theta is a slope parameter from the interval (-1, 1). Once again, you also need to specifcy the series length using the n argument.

# In this exercise, you'll simulate and plot thre MA models with slope parameters 0.5, 0.9, and -0.5, respectively.

# Generate MA model with slope 0.5
x <- arima.sim(model = list(ma = 0.5), n = 100)

# Generate MA model with slope 0.9
y <- arima.sim(model = list(ma = 0.9), n = 100)

# Generate MA model with slope -0.5
z <- arima.sim(model = list(ma = -0.5), n = 100)

# Plot all three models together
plot.ts(cbind(x, y, z))

#Estimate the autocorrelation function (ACF) for a moving average

# Now that you've simulated some MA data using the arima.sim() command, you may want to estimate the autocorrelation functions (ACF) for your data. 
# As in the previous chapter, you can use the acf() command to generate plots of the autocorrelation in your MA data.

# In this exercise, you'll use acf() to estimate the ACF for three simulated MA series, x, y, and z. 
# These series have slope parameters of 0.4, 0.9, and -0.75, respectively, and are shown in the figure on the right.

# Instructions
# Calculate ACF for x
acf(x)

# Calculate ACF for y
acf(y)

# Calculate ACF for z
acf(z)

##---
#Estimate the simple moving average model

#Now that you've simulated some MA models and calculated the ACF from these models, your next step is to 
# fit the simple moving average (MA) model to some data using the arima() command. For a given time series 
# x we can fit the simple moving average (MA) model using arima(..., order = c(0, 0, 1)). Note for reference 
# that an MA model is an ARIMA(0, 0, 1) model.

# In this exercise, you'll practice using a preloaded time series (x, shown in the plot on the right) as well 
# as the Nile dataset used in earlier chapters.

# Fit the MA model to x
arima(x, order = c(0, 0, 1))

# Paste the slope (ma1) estimate below
0.7928

# Paste the slope mean (intercept) estimate below
0.1589

# Paste the innovation variance (sigma^2) estimate below
0.9576

# Fit the MA model to Nile
MA <- arima(Nile, order = c(0, 0, 1))
print(MA)

# Plot Nile and MA_fit 
ts.plot(Nile)
MA_fit <- Nile - resid(MA)
points(MA_fit, type = "l", col = 2, lty = 2)

