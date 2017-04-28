require 'rails_helper'

RSpec.describe Description, type: :model do

  it { should belong_to(:well) }

  # it { should validate_presence_of(:depth) }

end
