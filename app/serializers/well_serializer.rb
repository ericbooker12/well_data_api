class WellSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :well_number, :depth_data, :lithologies

  # has_many :depth_data

  # link(:self) { well_url(object) }
end