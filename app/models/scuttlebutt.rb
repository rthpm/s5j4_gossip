class Scuttlebutt < ApplicationRecord
  belongs_to :user
  belongs_to :tags_scuttlebuts_connection
  has_many :tags, through: :tags_scuttlebuts_connection
  has_many :comments
  has_many :likes
end
