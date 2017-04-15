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

