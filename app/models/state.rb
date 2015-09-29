class State < ActiveRecord::Base
  belongs_to :student
  has_many :results
end