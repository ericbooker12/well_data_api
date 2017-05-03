FactoryGirl.define do
  factory :well do
    name { Faker::StarWars.character }
    start_date { Faker::Date.between(180.days.ago, Date.today) }
    end_date { Faker::Date.between(180.days.ago, Date.today) }
    total_depth { Faker::Number.number(4) }
    well_number 20
  end
end

FactoryGirl.define do
  factory :depth_datum do
		depth '2000'
		rop '30'
		wob '15'
		temp_in '80'
		temp_out '99'
		pressure '1500'
		well_id 1
  end
end
