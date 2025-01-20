# Load libraries
library(treeclim)

# Load the climate data
clim_man <- read.csv("meanclim_3.csv")  # Replace with the actual file name

# View the summary of the dataset
summary(clim_man)

# Create a copy of the temp column for manipulation
clim_man$manip_temp <- clim_man$temp

# Reduce the temp values for February, March, and April (months 2, 3, 6)
clim_man$manip_temp[clim_man$month %in% c(2, 3, 6)] <- clim_man$manip_temp[clim_man$month %in% c(2, 3, 6)] - 5

# Check changes to FMA months
summary(clim_man$manip_temp)

# Save the modified data to a new CSV file
# write.csv(clim_man, "meanclim_modified.csv", row.names = FALSE)

# Perform seasonal correlation analysis using the manipulated temperature column
sc <- seascorr(grow.crn, clim_man, complete = 11, primary = "manip_temp", secondary = "prec")

# Save the plot to a TIFF file
tiff("1Tryseascorr_resultsTRY1.tiff", width = 7, height = 5, units = "in", res = 300)  # Set dimensions and resolution
plot(sc)  # Plot the results
dev.off()  # Close the TIFF device
