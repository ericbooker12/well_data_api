class LithologySerializer < ActiveModel::Serializer
  attributes 	:depth,
				:felsite,
				:blueschist,
				:greenstone,
				:chert,
				:peridotite,
				:mum,
				:silicic_graywacke,
				:lithic_graywacke,
				:argillite,
				:serpentine,
				:clay,
				:blank,
				:well_id

  belongs_to :well
end