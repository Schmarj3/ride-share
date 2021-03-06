require 'date'
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
  # Layer 1 - Array of ride hashes
  # Layer 2 - Hash with keys for DRIVER_ID, DATE, COST, RIDER_ID, RATING
  # Layer 3 - Array of ints for Day, Month, Year


########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

# data structure blueprint
# [
#   {
#       driver_id: str,
#       date: [int, int, int],
#       cost: int,
#       rider_id: str,
#       rating: int
#   }
# ]

rides_data = [
    ['DRIVER_ID','DATE','COST','RIDER_ID','RATING'],
    ['DR0004','3rd Feb 2016','5','RD0022','5'],
    ['DR0001','3rd Feb 2016','10','RD0003','3'],
    ['DR0002','3rd Feb 2016','25','RD0073','5'],
    ['DR0001','3rd Feb 2016','30','RD0015','4'],
    ['DR0003','4th Feb 2016','5','RD0066','5'],
    ['DR0004','4th Feb 2016','10','RD0022','4'],
    ['DR0002','4th Feb 2016','15','RD0013','1'],
    ['DR0003','5th Feb 2016','50','RD0003','2'],
    ['DR0002','5th Feb 2016','35','RD0066','3'],
    ['DR0004','5th Feb 2016','20','RD0073','5'],
    ['DR0001','5th Feb 2016','45','RD0003','2']
]

# return an array with integer representation of dates
def line_break
  puts '--------------------------------------------------------'
end

def parse_date(date_string)
  day_month_year = []
  d = Date.parse(date_string)
  return day_month_year << d.mday  <<  d.mon  << d.year
end

# create the data structure from the blueprint
def structure_ride_share(data)
  top_array = []
  # create default hash keys based on column headings
  headings = data[0].map { |heading| heading.downcase.to_sym }

  (data.length - 1).times do |index|
    #skip heading
    index += 1

    #choose row of data
    row = data[index]

    #populate ride hashes - really long!
    ride = Hash[headings[0], row[0], headings[1], parse_date(row[1]), headings[2], row[2].to_i, headings[3], row[3], headings[4], row[4].to_i]
    top_array << ride
  end
  return top_array
end

ride_share_data = structure_ride_share(rides_data)
line_break
puts 'Ride Share Data:'
line_break
pp ride_share_data

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
def find_unique_values(value_type, data)
  unique_values = data.map { |ride_hash| ride_hash[value_type] }.uniq
  return unique_values
end

# - the number of rides each driver has given
def count_total_rides(id, data)
  count = data.count { |ride_hash| ride_hash.has_value? id }
  return count
end

# - the total amount of money each driver has made
def total_ride_cost(id, data)
  total_cost = 0
  data.each{ |ride_hash| total_cost += ride_hash[:cost] if ride_hash.value?(id) }
  return total_cost
end

# - the average rating for each driver
def calculate_average_rating(id, data)
  total_rides = count_total_rides(id, data)
  total_ratings = 0.to_f

  data.each{ |ride_hash| total_ratings += ride_hash[:rating] if ride_hash.value?(id) }

  average = total_ratings / total_rides
  return average.round(1)
end

line_break
puts 'Driver Summary:'
line_break
driver_summaries = find_unique_values(:driver_id, ride_share_data).map do |driver|
  {
      driver_id: driver,
      total_rides: count_total_rides(driver, ride_share_data),
      total_cost: total_ride_cost(driver, ride_share_data),
      average_rating: calculate_average_rating(driver, ride_share_data),
  }
end
#test
pp driver_summaries

# - Which driver made the most money?
line_break
puts 'Driver that made the most money:'
line_break
p driver_summaries.max { |a_hash, b_hash| a_hash[:total_cost] <=> b_hash[:total_cost] }[:driver_id]

# - Which driver has the highest average rating?
line_break
puts 'Driver that has the highest average rating:'
line_break
p driver_summaries.max { |a_hash, b_hash| a_hash[:rating] <=> b_hash[:rating] }[:driver_id]