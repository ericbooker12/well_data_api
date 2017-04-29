require 'rails_helper'

RSpec.describe Well, type: :model do

  it { should have_many(:descriptions).dependent(:destroy) }
  it { should have_many(:lithologies).dependent(:destroy) }
	it { should have_many(:mineralogies).dependent(:destroy) }
	it { should have_many(:well_symbols).dependent(:destroy) }
	it { should have_many(:depth_data).dependent(:destroy) }

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:well_number) }

end
