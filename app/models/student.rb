class Student < ActiveRecord::Base
  belongs_to :year
  has_one :state

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true
end