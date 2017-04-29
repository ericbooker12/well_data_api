FactoryGirl.define do
  factory :well do
    name { Faker::Superhero.name }
    start_date { Faker::Date.between(180.days.ago, Date.today) }
    end_date { Faker::Date.between(180.days.ago, Date.today) }
    total_depth { Faker::Number.number(4) }
    well_number 20
  end
end

FactoryGirl.define do
  factory :depth_datum do
		depth { Faker::Number.between(1, 5000) }
		rop { Faker::Number.decimal(1)}
		wob { Faker::Number.decimal(1)}
		temp_in { Faker::Number.decimal(1)}
		temp_out { Faker::Number.decimal(1)}
		pressure { Faker::Number.decimal(1)}
		well_id 2
  end
end