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

# Display the first few lines of the dataset 
head(data, n = 15)

# Create your plot here
plot(data$yahoo)

# Add a title to the plot 
plot(data$yahoo, main = "yahoo")

# Change X and Y axis labels 
plot(data$yahoo,main = "yahoo", xlab = "date", ylab = "price")

# Plot function - basic parameters (2)

# More customization can be achieved with the plot() function using other options. Should you want to:

# Use bars instead of points - type
# Add a subtitle to your chart - sub
# Change the color of the line -col
# Make the line thicker or narrower - lwd



# Instructions
# Plot the second time series and change the title of the chart to "microsoft"
# Include a subtiltle: "Daily closing price since 2015"
# Use bars instead of points for the chart type
# Change the color of the line to red

# Plot the second time series and change the title
plot(data$microsoft, main = "microsoft")

# Include a subtitle
plot(data$microsoft, main = "microsoft", sub = "Daily closing price since 2015")

# Use bars instead of points
plot(data$microsoft, main = "microsoft", sub = "Daily closing price since 2015", type = "h")

# Change the color of the line to red
plot(data$microsoft, main = "microsoft", sub = "Daily closing price since 2015", type = "h")