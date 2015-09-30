class Result < ActiveRecord::Base
  belongs_to :state

  validates :subject, presence: true
end
