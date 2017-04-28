require 'rails_helper'

RSpec.describe Lithology, type: :model do

  it { should belong_to(:well) }

  # it { should validate_presence_of(:depth) }
end
