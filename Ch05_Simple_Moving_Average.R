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
