########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
  # Layer 1 - Array of ride hashes
  # Layer 2 - DRIVER_ID, DATE, COST, RIDER_ID, RATING
  # Layer 3 - Day, Month, Year

# Which layers are nested in each other?
  # Layer 3 is nested in Date of Layer 2, and Layer 2 is nested in Layer 1

# Which layers of data "have" within it a different layer?
  # Date of Layer 2

# Which layers are "next" to each other?
  # All of the column headings

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?