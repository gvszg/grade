class Post < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :checks, as: :checkable

  validates :title, presence: true
  validates :description, presence: true

  def check_count
    self.checks.where(check: true).size
  end
end