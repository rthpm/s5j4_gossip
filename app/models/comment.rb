class Comment < ApplicationRecord
  belongs_to :scuttlebutt, optional: true
  belongs_to :subcomment, polymorphic: true, optional: true
  belongs_to :user
  has_many :likes
  has_many :comments, as: :subcomment
end
