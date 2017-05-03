require 'faker'

Well.destroy_all
DepthDatum.destroy_all

i = 1
10.times do
	Well.create!(
		name:  Faker::StarWars.character ,
		start_date:  Faker::Date.between(180.days.ago, Date.today) ,
		end_date:  Faker::Date.between(180.days.ago, Date.today) ,
		total_depth:  Faker::Number.number(4) ,
		well_number:  i
	)
	p "Creating  Well #{i}"
	i += 1
end


rows = []
File.foreach("data/log/depth.txt") do |line|  # read in one line/row at a time
	row = line.split(" ") 			# convert each row to an array

	i = 0
	new_row = []
	while i < 6						# only get the first 6 columns
		new_row << row.shift.to_f	# convert the elements to a decimal/float
		i += 1						# and shovel into another array
	end

	rows << new_row					# shovel row array into array
end 								# end up with double array representing rows and columns

i = 0
rows.each do |row|					#[69.00, 139.30, 35.90, 54.30, 58.42, 635.66]

data = DepthDatum.create!(
	depth: row[0],
	rop: row[1],
	wob: row[2],
	temp_in: row[3],
	temp_out: row[4],
	pressure: row[5],
	well_id: Well.first.id
	)

	if i % 100 == 0
		j = i / 100
		print "=" * j
		p " #{i} lines"
	end

	i += 1
end


