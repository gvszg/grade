class Year < ActiveRecord::Base
  has_many :students

  validates :number, presence: true
end