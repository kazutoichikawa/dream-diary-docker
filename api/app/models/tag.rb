class Tag < ApplicationRecord
  has_many :dreams
  has_many :dreams, through: :dream_tag_relations

  validates :name, uniqueness: true
end
