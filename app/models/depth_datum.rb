class DepthDatum < ApplicationRecord
  belongs_to :well

  validates_presence_of :depth
end
