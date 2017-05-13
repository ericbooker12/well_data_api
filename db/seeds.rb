require 'faker'
require_relative 'seed_helpers'
include SeedsHelper

# Well.destroy_all
# DepthDatum.destroy_all

# i = 1
# 10.times do
# 	Well.create!(
# 		name:  Faker::StarWars.character ,
# 		start_date:  Faker::Date.between(180.days.ago, Date.today) ,
# 		end_date:  Faker::Date.between(180.days.ago, Date.today) ,
# 		total_depth:  Faker::Number.number(4) ,
# 		well_number:  i
# 	)
# 	p "Creating  Well #{i}"
# 	i += 1
# end


# rows = []
# File.foreach("data/log/depth.txt") do |line|  # read in one line/row at a time
# 	row = line.split(" ") 			# convert each row to an array

# 	i = 0
# 	new_row = []
# 	while i < 6						# only get the first 6 columns
# 		new_row << row.shift.to_f	# convert the elements to a decimal/float
# 		i += 1						# and shovel into another array
# 	end

# 	rows << new_row					# shovel row array into array
# end 								# end up with double array representing rows and columns

# i = 0
# rows.each do |row|					#[69.00, 139.30, 35.90, 54.30, 58.42, 635.66]

# data = DepthDatum.create!(
# 	depth: row[0],
# 	rop: row[1],
# 	wob: row[2],
# 	temp_in: row[3],
# 	temp_out: row[4],
# 	pressure: row[5],
# 	well_id: Well.first.id
# 	)

# 	if i % 100 == 0
# 		j = i / 100
# 		print "=" * j
# 		p " #{i} lines"
# 	end

# 	i += 1
# end

####################################################################

# Lithology.destroy_all

# lith_data = ''
# lith = File.open("data/log/lith.txt", "r") do |file|
#   lith_data = file.read.chomp
# end

# lith_arr = lith_data.split("\r\n")

# new_data = []

# i = 0
# lith_arr.each do |lith|
# 	if i > 2
# 		lith = lith.split(' ')
# 		lith[0] = lith[0].to_i  #depth
# 		lith[1] = count_lith(lith[1])
# 		new_data << lith
# 	end
# 	i += 1
# end

# new_data = insert_missing_depths_to_lith(new_data)

# # test_lith =  new_data[200]
# # p test_lith[1][0] #["D", "S"]
# # p test_lith[1][1] #[20, 80]
# # [3520, [["D", "S"], [20, 80]]]

# new_data.each do |lith|
# 	depth = lith[0]
# 	syms  = lith[1][0]
# 	perc  = lith[1][1]

# 	Lithology.create(
# 		depth: depth,
# 		felsite: 						syms.include?('F') ? perc[syms.index('S')] : 0,
# 		blueschist: 				syms.include?('X') ? perc[syms.index('X')] : 0,
# 		greenstone: 				syms.include?('G') ? perc[syms.index('G')] : 0,
# 		chert: 							syms.include?('C') ? perc[syms.index('C')] : 0,
# 		peridotite: 				syms.include?('T') ? perc[syms.index('T')] : 0,
# 		mum: 								syms.include?('D') ? perc[syms.index('D')] : 0,
# 		silicic_graywacke: 	syms.include?('I') ? perc[syms.index('I')] : 0,
# 		lithic_graywacke: 	syms.include?('L') ? perc[syms.index('L')] : 0,
# 		argillite: 					syms.include?('A') ? perc[syms.index('A')] : 0,
# 		serpentine: 				syms.include?('S') ? perc[syms.index('S')] : 0,
# 		clay: 							syms.include?('Y') ? perc[syms.index('Y')] : 0,
# 		blank: 							syms.include?('B') ? perc[syms.index('B')] : 0,
# 		well_id: 1
# 	)

# 	p "Record written for depth #{depth}"

# end

# data = insert_missing_depths_to_lith(new_data)

# writeArrayToJSFile("data/lith.js", "lith", data)
# p new_data.length

##############################################################
Mineralogy.destroy_all

min_data = ''

min_conversion = {
	'-' => 0,
	'r' => 1,
	't' => 2,
	'm' => 3,
	'c' => 4,
	'a' => 5
}

# p min_conversion['m']

min = File.open("data/log/min.txt", "r") do |file|
  min_data = file.read.chomp
end

min_arr = min_data.split("\r\n")

min_arr.each do |line|
	line_arr = line.split(' ')
	Mineralogy.create(depth: line_arr[0].to_f,
    quartz: min_conversion[line_arr[1]],
    calcite: min_conversion[line_arr[2]],
    pyrite: min_conversion[line_arr[3]],
    pyrrhotite: min_conversion[line_arr[4]],
    chlorite: min_conversion[line_arr[5]],
    axinite: min_conversion[line_arr[6]],
    actinolite: min_conversion[line_arr[7]],
    tourmaline: min_conversion[line_arr[8]],
    well_id: 1
	)
end










