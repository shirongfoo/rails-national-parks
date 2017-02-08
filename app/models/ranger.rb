class Ranger < ApplicationRecord
  has_and_belongs_to_many :parks

  validates :name,
    presence: true
end
