class WellSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :total_depth, :well_number, :depth_data

  has_many :depth_data

  link(:self) { well_url(object) }
end