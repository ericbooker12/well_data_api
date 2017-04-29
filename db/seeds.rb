require 'faker'
Well.delete_all

10.times do
		Well.create(
			name:  Faker::Superhero.name ,
			start_date:  Faker::Date.between(180.days.ago, Date.today) ,
			end_date:  Faker::Date.between(180.days.ago, Date.today) ,
			total_depth:  Faker::Number.number(4) ,
			well_number:  Faker::Number.between(100, 200)
		)
end