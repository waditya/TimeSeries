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

#Simple forecasts from an estimated MA model

# # Now that you've estimated a MA model with your Nile data, the next step is to do some simple forecasting with your model. 
# As with other types of models, you can use the predict() function to make simple forecasts from your estimated MA model. 
# Recall that the $pred value is the forecast, while the $se value is a standard error for that forecast, 
# each of which is based on the fitted MA model.

# Once again, to make predictions for several periods beyond the last observation you can use the n.ahead = h argument 
# in your call to predict(). The forecasts are made recursively from 1 to h-steps ahead from the end of the observed time series. 
# However, note that except for the 1-step forecast, all forecasts from the MA model are equal to the estimated mean (intercept).

# In this exercise, you'll use the MA model derived from your Nile data to make simple forecasts about future River Nile flow levels. 
# Your MA model from the previous exercise is available in your environment.

# Make a 1-step forecast based on MA
predict_MA <- predict(MA)

# Obtain the 1-step forecast using $pred[1]
predict_MA$pred[1] 

# Make a 1-step through 10-step forecast based on MA
predict(MA, n.ahead = 10)

# Plot the Nile series plus the forecast and 95% prediction intervals
ts.plot(Nile, xlim = c(1871, 1980))
MA_forecasts <- predict(MA, n.ahead = 10)$pred
MA_forecast_se <- predict(MA, n.ahead = 10)$se
points(MA_forecasts, type = "l", col = 2)
points(MA_forecasts - 2*MA_forecast_se, type = "l", col = 2, lty = 2)
points(MA_forecasts + 2*MA_forecast_se, type = "l", col = 2, lty = 2)


AR vs MA models

# As you've seen, autoregressive (AR) and simple moving average (MA) are two useful approaches to modeling time series. 
# But how can you determine whether an AR or MA model is more appropriate in practice?

# To determine model fit, you can measure the Akaike information criterion (AIC) and Bayesian information criterian (BIC) for each model. 
# While the math underlying the AIC and BIC is beyond the scope of this course, for your purposes the main idea is these these indicators 
# penalize models with more estimated parameters, to avoid overfitting, and smaller values are preferred. All factors being equal, a model 
# that produces a lower AIC or BIC than another model is considered a better fit.

# To estimate these indicators, you can use the AIC() and BIC() commands, both of which require a single argument to specify the model in question.

# In this exercise, you'll return to the Nile data and the AR and MA models you fitted to this data. These models and their predictions for the 
# 1970s (AR_fit) and (MA_fit) are depicted in the plot on the right.


# Find correlation between AR_fit and MA_fit
cor(AR_fit, MA_fit)

# Find AIC of AR
AIC(AR)

# Find AIC of MA
AIC(MA)

# Find BIC of AR
BIC(AR)

# Find BIC of MA
BIC(MA)
