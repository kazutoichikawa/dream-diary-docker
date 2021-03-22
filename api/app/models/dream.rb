class Dream < ApplicationRecord
  has_many :dream_tag_relations
  has_many :tags, through: :dream_tag_relations
end
