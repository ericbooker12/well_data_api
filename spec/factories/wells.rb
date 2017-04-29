FactoryGirl.define do
  factory :well do
    name "lloyd"
    start_date { Faker::Date.between(180.days.ago, Date.today) }
    start_date { Faker::Date.between(180.days.ago, Date.today) }
    total_depth { Faker::Number.number(4) }
  end
end