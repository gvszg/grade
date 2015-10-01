class Student < ActiveRecord::Base
  belongs_to :year
  has_one :state

  validates :number, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
end