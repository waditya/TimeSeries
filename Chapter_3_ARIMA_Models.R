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

# Plot the sample P/ACF pair of the differenced data 
acf2(diff(globtemp))

# Fit an ARIMA(1,1,1) model to globtemp
sarima(globtemp, 1, 1, 1)

# Fit an ARIMA(0,1,2) model to globtemp. Which model is better?
sarima(globtemp, 0, 1, 2)

# Excellent! Judging by the AIC and BIC, the ARIMA(0,1,2) model performs better than the ARIMA(1,1,1) model on the globtemp data. 
# Remember to thoroughly examine the output of your sarima() command to gain a full understanding of your model.

# Diagnostics - Simulated Overfitting
# 100xp
# One way to check an analysis is to overfit the model by adding an extra parameter to see if it makes a difference in the results. If adding parameters changes the results drastically, then you should rethink your model. If, however, the results do not change by much, you can be confident that your fit is correct.

# We generated 250 observations from an ARIMA(0,1,1) model with MA parameter .9. First, you will fit the model to the data using established techniques.

# Then, you can check a model by overfitting (adding a parameter) to see if it makes a difference. In this case, you will add an additional MA parameter to see that it is not needed.

# As usual, the astsa package is preloaded and the generated data in x are plotted in your workspace. The differenced data diff(x) are also plotted. Note that it looks stationary.

# Instructions
# Plot the sample ACF and PACF of the differenced data using acf2() and note that the model is easily identified.
# Fit an ARIMA(0,1,1) model to the simulated data using sarima(). Compare the MA parameter estimate to the actual value of .9, and examine the residual plots.
# Overfit the model by adding an additional MA parameter. That is, fit an ARIMA(0,1,2) to the data and compare it to the ARIMA(0,1,1) run.

# Plot sample P/ACF pair of the differenced data
acf2(diff(x))

# Fit the first model, compare parameters, check diagnostics
sarima(x, 0, 1, 1)

# Fit the second model and compare fit
sarima(x, 0, 1, 2)

# Great job! As you can see from the t-table, the second MA parameter is not significantly different 
# from zero and the first MA parameter is approximately the same in each run. 
# Also, the AIC and BIC both increase when the parameter is added. 
# In addition, the residual analysis of your ARIMA(0,1,1) model is fine. 
# All of these facts together indicate that you have a successful model fit.

# Diagnostics - Global Temperatures
# 100xp
# You can now finish your analysis of global temperatures. Recall that you previously fit two models to the data in globtemp, an ARIMA(1,1,1) and an ARIMA(0,1,2). In the final analysis, check the residual diagnostics and use AIC and BIC for model choice.

# The data are plotted for you.

# Instructions
# Fit an ARIMA(0,1,2) model to globtemp and check the diagnositcs. What does the output tell you about the model?
# Fit an ARIMA(1,1,1) model to globtemp and check the diagnostics.
# Which is the better model? Type your answer into the blanks in your R workspace (ex. either ARIMA(0,1,2) or ARIMA(1,1,1)).

# Fit ARIMA(0,1,2) to globtemp and check diagnostics  
 sarima(globtemp, 0, 1, 2)

# Fit ARIMA(1,1,1) to globtemp and check diagnostics
sarima(globtemp, 1, 1, 1)

# Which is the better model?
"ARIMA(1,1,1)"

# Exellent! Your model diagnostics suggest that both the ARIMA(0,1,2) and the ARIMA(1,1,1) are reasonable models. 

# However, the AIC and BIC suggest that the ARIMA(0,1,2) performs slightly better, so this should be your preferred model. 

# Although you were not asked to do so, you can use overfitting to assess the final model. 

# For example, try fitting an ARIMA(1,1,2) or an ARIMA(0,1,3) to the data.
# Forecasting Simulated ARIMA

# Now that you are an expert at fitting ARIMA models, you can use your skills for forecasting. First, you will work with simulated data.

# We generated 120 observations from an ARIMA(1,1,0) model with AR parameter .9. The data are in y and the first 100 observations are in x. These observations are plotted for you. You will fit an ARIMA(1,1,0) model to the data in x and verify that the model fits well. Then use sarima.for() from astsa to forecast the data 20 time periods ahead. You will then compare the forecasts to the actual data in y.

# The basic syntax for forecasting is sarima.for(data, n.ahead, p, d, q) where n.ahead is a positive integer that specifies the forecast horizon. The predicted values and their standard errors are printed, the data are plotted in black, and the forecasts are in red along with 2 mean square prediction error bounds as blue dashed lines.

# The astsa package is preloaded and the data (x) and differenced data (diff(x)) are plotted.

# Instructions
# Plot the sample ACF and PACF of the differenced data to determine a model.
# Use sarima() to fit an ARIMA(1,1,0) to the data. Examine the output of your sarima() command to assess the fit and model diagnostics.
# Use sarima.for() to forecast the data 20 time periods ahead. Compare it to the actual values.

# Plot P/ACF pair of differenced data 
acf2(diff(x))

# Fit model - check t-table and diagnostics
sarima(x, 1, 1, 0)

# Forecast the data 20 time periods ahead
sarima.for(x, n.ahead = 20, p = 1, d = 1, q = 0) 
lines(y)  

 
