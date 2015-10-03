class User < ActiveRecord::Base
  after_create :user_guest

  has_many :posts
  has_many :checks
  has_secure_password

  validates :name, presence: true
  validates :password, on: :create, length:{minimum: 6}

  def admin?
    self.role == 'admin'
  end

  def user_guest
    self.role = 'guest'
    self.save
  end
end