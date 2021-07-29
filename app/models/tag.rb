class Tag < ApplicationRecord
  belongs_to :tags_scuttlebuts_connection, required: false
  has_many :scuttlebutts, through: :tags_scuttlebuts_connection
end
