#visualizing-time-series-data-in-r

# Plot function - basic parameters (1)
# 100xp
# The plot.xts() function is the most useful tool in the R time series data visualization artillery. 

# It is fairly similar to general plotting, but the x-axis contains a time scale. 

# You can use plot() instead of plot.xts() if the object used in the function is an xts object. 

# The basic syntax looks like this: plot(mydata).

# There is a very wide variety of options allowing endless possibilities. 

# For example, plot(mydata, main = "Stock XYZ", lwd = 2) adds a title to the chart (main) and makes the line thicker (lwd). 

# But you can do a a lot more: changing the size of the margin or the character, playing around with the colours or the axis, plotting more than one series, etc. 

# In this exercise, you will use the dataset (data) containing the daily stocks price for 4 companies since 2015.

 # The column titles are: yahoo, microsoft, citigroup and dow_chemical.
