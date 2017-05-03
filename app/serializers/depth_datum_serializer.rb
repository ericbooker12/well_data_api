class DepthDatumSerializer < ActiveModel::Serializer
  attributes :depth, :rop, :wob, :temp_in, :temp_out, :pressure, :well_id

  belongs_to :well
end
