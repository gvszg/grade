class Result < ActiveRecord::Base
  belongs_to :state

  validates :subject, presence: true
  validates :score, presence: true
end
