class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :duels

  validates_uniqueness_of :name
end
