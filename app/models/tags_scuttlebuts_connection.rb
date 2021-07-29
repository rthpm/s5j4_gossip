class TagsScuttlebutsConnection < ApplicationRecord
  belongs_to :tag
  belongs_to :scuttlebutt
end
