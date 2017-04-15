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

