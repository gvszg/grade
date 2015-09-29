class State < ActiveRecord::Base
  belongs_to :student
  has_many :results

  validates :student_id, presence: true
  validates :student_id, numericality: { only_integer: true }
end